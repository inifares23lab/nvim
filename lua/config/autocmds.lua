-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "*" },
    callback = function()
        vim.b.autoformat = false
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp_attach_auto_diag", { clear = true }),
    callback = function(args)
        -- the buffer where the lsp attached
        ---@type number
        local buffer = args.buf

        local lspDiagnosticsVirtualTextFocusable = false
        local lspDiagnosticsShowNormal = true
        -- local lspDiagnosticsShowInsert = true

        vim.keymap.set("n", "<leader>x;f", function()
                lspDiagnosticsVirtualTextFocusable = not lspDiagnosticsVirtualTextFocusable
            end,
            { desc = "focus diagnostic virtual text toggle" })

        vim.keymap.set("n", "<leader>x;n", function() lspDiagnosticsShowNormal = not lspDiagnosticsShowNormal end,
            { desc = "normal diagnostic virtual text toggle" })

        -- vim.keymap.set("n", "<leader>x;i", function() lspDiagnosticsShowInsert = not lspDiagnosticsShowInsert end,
        --     { desc = "insert diagnostic virtual text toggle" })

        vim.keymap.set("n", "<leader>x;e", function()
                lspDiagnosticsShowNormal = true
                -- lspDiagnosticsShowInsert = true
            end,
            { desc = "enable diagnostic virtual text" })

        vim.keymap.set("n", "<leader>x;d", function()
                lspDiagnosticsShowNormal = false
                -- lspDiagnosticsShowInsert = false
            end,
            { desc = "disable diagnostic virtual text" })

        vim.keymap.set("n", "<leader>x;", function()
                local f = "focusable: " .. (lspDiagnosticsVirtualTextFocusable and "true" or "false")
                local n = "normal mode: " .. (lspDiagnosticsShowNormal and "enabled" or "disabled")
                -- local i = "insert mode: " .. (lspDiagnosticsShowInsert and "enabled" or "disabled")
                vim.notify("diagnostic virtual text\n\t" .. f .. "\n\t" .. n) -- .. "\n\t" .. i)
            end,
            { desc = "show diagnostic virtual text status(<CR>)" })

        -- create the autocmd to show diagnostics
        vim.api.nvim_create_autocmd({ "CursorHold" }, {
            group = vim.api.nvim_create_augroup("_auto_diag", { clear = true }),
            buffer = buffer,
            callback = function()
                if not lspDiagnosticsShowNormal then
                    return
                end
                local opts = {
                    focusable = lspDiagnosticsVirtualTextFocusable,
                    close_events = { "BufLeave", "CursorMoved", "CursorMovedI", "InsertEnter", "FocusLost" },
                    border = "rounded",
                    source = "always",
                    prefix = " ",
                    scope = "line",
                }
                vim.diagnostic.open_float(nil, opts)
            end,
        })

        -- vim.api.nvim_create_autocmd({ "CursorHoldI" }, {
        --     group = vim.api.nvim_create_augroup("_auto_diag", { clear = false }),
        --     buffer = buffer,
        --     callback = function()
        --         if not lspDiagnosticsShowInsert then
        --             return
        --         end
        --         local opts = {
        --             focusable = lspDiagnosticsVirtualTextFocusable,
        --             close_events = { "BufLeave", "CursorMoved", "CursorMovedI", "InsertLeave", "FocusLost" },
        --             border = "rounded",
        --             source = "always",
        --             prefix = " ",
        --             scope = "cursor",
        --         }
        --         vim.diagnostic.open_float(nil, opts)
        --     end,
        -- })
    end,
})
