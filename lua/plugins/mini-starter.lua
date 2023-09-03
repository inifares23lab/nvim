return {
    {
        "echasnovski/mini.starter",
        version = "*",
        config = function()
            local stats = require("lazy").stats()
            local ministarter = require("mini.starter")
            vim.api.nvim_create_autocmd("User", {
                pattern = "LazyVimStarted",
                callback = function()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    ministarter.config.header = "⚡ Neovim loaded " ..
                        stats.loaded .. " plugins out of " .. stats.count .. " in " .. ms .. "ms"
                    ministarter.refresh()
                end,
            })

            vim.keymap.set("n", "<leader>;", function() ministarter.open() end, { desc = "Mini starter" })
            ministarter.setup({
                evaluate_single = true,
                items = {
                    {
                        name = "New file",
                        action = "enew",
                        section = "  New file",
                    },
                    {
                        name = "Workspace list",
                        action = "WorkspacesOpen",
                        section = "  Workspaces"
                    },
                    {
                        name = "Sessions list",
                        action = "lua MiniSessions.select()",
                        section = "  Sessions",
                    },
                    {
                        name = "Bookmarks list",
                        action = "Telescope bookmarks list",
                        section = "B  Bookmarks",
                    },
                    {
                        name = "Recent Files",
                        action = "Telescope oldfiles",
                        section = "  Recent",
                    },
                    {
                        name = "File finder",
                        action = "Telescope find_files",
                        section = "󰈞  Find files",
                    },
                    {
                        name = "Live grep args",
                        action = "Telescope live_grep_args",
                        section = "  Find text",
                    },
                    {
                        name = "Ast grep",
                        action = "Telescope ast_grep",
                        section = "  Find text",
                    },
                    {
                        name = "Help tags finder",
                        action = "Telescope help_tags",
                        section = "H  Help Tags",
                    },
                    {
                        name = "Command history",
                        action = "Telescope command_history",
                        section = "C  Command history",
                    },
                    {
                        name = "To do file",
                        action = "e ~/.personal/TODO.md",
                        section = "T  TODO",
                    },
                    {
                        name = "Edit config",
                        action = "e $MYVIMRC",
                        section = "  Config",
                    },
                    {
                        name = "Quit",
                        action = "qa",
                        section = "  Quit",
                    },
                }
            })
        end
    }
}
