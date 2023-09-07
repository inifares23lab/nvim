return {
    {
        "akinsho/bufferline.nvim",
        opts = function(_, opts)
            opts.options.numbers = 'both'
            opts.options.always_show_bufferline = true
            opts.options.separator_style = 'slant'
            opts.options.show_tab_indicators = true
            opts.options.mode = 'buffers'
        end
    }
}
