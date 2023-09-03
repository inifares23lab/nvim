return {
    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup()
            vim.keymap.set("n", "<leader>co", "<CMD>SymbolsOutline<CR>", { silent = true, desc = "Outline" })
        end,
    },
}
