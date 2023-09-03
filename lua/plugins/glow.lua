return {
    {
        "ellisonleao/glow.nvim",
        cmd = "Glow",
        opts = function(_, opts)
            opts.border = "double"
            opts.pager = true
            opts.width_ratio = 0.9
            opts.height_ratio = 0.8
        end
    }
}
