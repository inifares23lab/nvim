if true then return {} end
return {
    {
        "folke/noice.nvim",
        opts = function(_, opts)
            opts.lsp.signature = { enabled = false }
        end
    }
}
