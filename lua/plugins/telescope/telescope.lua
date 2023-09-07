return {
    {
        "nvim-telescope/telescope.nvim",
        opts = function(_, opts)
            opts.defaults = {
                path_display = {
                    "smart",
                },
                layout_strategy = "bottom_pane",
                layout_config = {
                    bottom_pane = {
                        width = 1,
                        height = 0.85,
                    },
                },
                initial_mode = "insert",
                borderchars = "zz",
                winblend = 3,
                prompt_position = "top",
                enable_git_status = true,
                enable_diagnostics = true,
            }
            opts.pickers = {
                colorscheme = {
                    enable_preview = true,
                },
                find_files = {
                    previewer = false,
                    cwd = require('lspconfig.util').root_pattern(".git")(vim.fn.expand("%:p")),
                }
            }

            vim.keymap.set("n", "<leader><leader>", "<CMD>Telescope<CR>", { desc = "+Telescope" })
            vim.keymap.set("n", "<leader><leader><CR>", "<Nop>", { desc = "Telescope" })

            vim.keymap.set("n", "<leader><leader>t", function()
                    local cur_buf = vim.api.nvim_get_current_buf()
                    require("telescope.actions.layout").toggle_preview(cur_buf)
                end,
                { desc = "Telescope toggle preview" })

            vim.keymap.set("n", "<leader><leader>p", "<Nop>", { desc = "+peek (Telescope)" })
            vim.keymap.set("n", "<leader><leader>pt", "<cmd>Telescope lsp_type_definitions<CR>",
                { desc = "type definitions" })
            vim.keymap.set("n", "<leader><leader>pd", "<cmd>Telescope lsp_definitions<CR>",
                { desc = "definitions" })
            vim.keymap.set("n", "<leader><leader>pp", "<cmd>Telescope lsp_implementations<CR>",
                { desc = "implementations" })
            vim.keymap.set("n", "<leader><leader>pr", "<cmd>Telescope lsp_references<CR>",
                { desc = "references" })
            vim.keymap.set("n", "<leader><leader>po", "<cmd>Telescope lsp_outgoing_calls<CR>",
                { desc = "outgoing" })
            vim.keymap.set("n", "<leader><leader>pi", "<cmd>Telescope lsp_incoming_calls<CR>",
                { desc = "incoming" })
            vim.keymap.set("n", "<leader><leader>pq", "<cmd>Telescope quickfix<CR>",
                { desc = "quickfix" })
            vim.keymap.set("n", "<leader><leader>pw", "<cmd>Telescope diagnostics<CR>",
                { desc = "workspace diagnostics" })
            vim.keymap.set("n", "<leader><leader>pb", "<cmd>Telescope diagnostics bufnr=0<CR>",
                { desc = "buffer diagnostics" })
            vim.keymap.set("n", "<leader><leader>ps", "<cmd>Telescope lsp_document_symbols<cr>",
                { desc = "document symbols" })
            vim.keymap.set("n", "<leader><leader>pS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
                { desc = "dynamic workspace symbols" })
        end
    }
}
