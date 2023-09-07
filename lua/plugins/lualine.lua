return {
    {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
            local icons = require("lazyvim.config").icons
            opts.sections.lualine_c = {
                {
                    "diagnostics",
                    symbols = {
                        error = icons.diagnostics.Error,
                        warn = icons.diagnostics.Warn,
                        info = icons.diagnostics.Info,
                        hint = icons.diagnostics.Hint,
                    },
                },
                { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                { "filename", path = 0, symbols = { modified = "", readonly = "🔒", unnamed = "�" } },
                {
                    function() return require("nvim-navic").get_location() end,
                    cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
                },
                {
                    function() return "{…}" .. vim.fn["codeium#GetStatusString"]() end
                },
            }
        end
    }
}
