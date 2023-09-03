return {
    {
        "tomasky/bookmarks.nvim",
        -- after = "telescope.nvim",
        event = "VimEnter",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            require("bookmarks").setup({
                save_file = vim.fn.stdpath("data") .. "/bookmarks", -- bookmarks save file path
                keywords = {
                    ["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
                    ["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
                    ["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
                    ["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
                },
            })

            vim.keymap.set(
                "n",
                "<leader>m",
                "<Nop>",
                { desc = "+bookmarks" }
            )
            vim.keymap.set("n",
                "<leader>mm",
                require("bookmarks").bookmark_toggle,
                { desc = "toggle line" }
            )
            vim.keymap.set("n",
                "<leader>mi",
                require("bookmarks").bookmark_ann,
                { desc = "add/edit line" }
            )
            vim.keymap.set("n",
                "<leader>mc",
                require("bookmarks").bookmark_clean,
                { desc = "clean buffer" }
            )
            vim.keymap.set("n",
                "<leader>mn",
                require("bookmarks").bookmark_next,
                { desc = "next" }
            )
            vim.keymap.set("n",
                "<leader>mp",
                require("bookmarks").bookmark_prev,
                { desc = "prev" }
            )
            vim.keymap.set("n",
                "<leader>ml",
                require("bookmarks").bookmark_list,
                { desc = "list" }
            )
            require("telescope").load_extension("bookmarks")
        end,
    },
}
