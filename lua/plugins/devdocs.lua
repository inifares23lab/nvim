return {
    {
        "luckasRanarison/nvim-devdocs",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter",
            "ellisonleao/glow.nvim",
        },
        opts = function(_, opts)
            opts.previewer_cmd = "glow"
        end
    }
}
