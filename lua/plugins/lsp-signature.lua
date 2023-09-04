if true then return {} end
return {
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            opts.noice = true
        end
    }
}
