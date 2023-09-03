return {
    {
        "Marskey/telescope-sg",
        dependencies = "nvim-telescope/telescope.nvim",
        config = function()
            require("telescope").load_extension("ast_grep")
        end
    }
}
