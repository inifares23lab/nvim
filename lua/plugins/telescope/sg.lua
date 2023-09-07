return {
    {
        "Marskey/telescope-sg",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").load_extension("ast_grep")
            vim.keymap.set("n", "<leader>sg", "<CMD>Telescope ast_grep<CR>", { desc = "Ast Grep" })
        end
    }
}
