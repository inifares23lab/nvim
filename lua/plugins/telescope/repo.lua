return {
    {
        'cljoly/telescope-repo.nvim',
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").load_extension("repo")
        end
    }
}
