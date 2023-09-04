if true then return {} end
return {
    {
        "L3MON4D3/LuaSnip",
        keys = function()
            return {}
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-emoji",
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local luasnip = require("luasnip")
            local cmp = require("cmp")
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            opts.formatting.format = function(entry, vim_item)
                vim_item.menu = ({
                    nvim_lsp = '[L]',
                    luasnip = '[S]',
                    path = '[P]',
                    buffer = '[B]',
                    codeium = '[C]',
                    crates = '[R]',
                })[entry.source.name]
                return vim_item
            end

            opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "codeium" } }))

            local showSources = function()
                local str = ""
                for i, v in ipairs(opts.sources) do
                    local flag = (v.max_item_count == nil and "enabled")
                        or (v.max_item_count > 0 and "enabled")
                        or "disabled"
                    str = str .. i .. " " .. v.name .. " " .. flag .. "\n"
                end
                vim.notify(str)
            end

            vim.keymap.set("n", "<leader>cc", showSources, { desc = "Current sources" })

            for i, v in ipairs(opts.sources) do
                vim.keymap.set("n", "<leader>cc" .. i, function()
                    if opts.sources[i].max_item_count == 0 then
                        opts.sources[i].max_item_count = nil
                    elseif opts.sources[i].max_item_count == nil then
                        opts.sources[i].max_item_count = 0
                    else
                        opts.sources[i].max_item_count = opts.sources[i].max_item_count * -1
                    end
                    vim.notify("toggled source " .. v.name)
                end, { desc = "toggle " .. v.name })
            end

            opts.mapping = {
                ['<C-g>']     = cmp.mapping.scroll_docs(-4),
                ['<C-f>']     = cmp.mapping.scroll_docs(4),
                ['<CR>']      = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
                ["<Tab>"]     = cmp.mapping.select_next_item(),
                ["<S-Tab>"]   = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<C-Space>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.abort()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<Right>"]   = cmp.mapping(function(fallback)
                    if cmp.visible() and vim.fn.col(".") == vim.fn.col("$") then
                        cmp.abort()
                    else
                        fallback()
                    end
                end, { "i", "s" })
            }
        end,
    },
}
