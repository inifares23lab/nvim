return {
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                defaults = {
                    layout_strategy = "bottom_pane",
                    layout_config = {
                        bottom_pane = {
                            width = 1,
                            height = 0.85,
                        },
                    },
                    initial_mode = "insert",
                    borderchars = "zz",
                    winblend = 3,
                    prompt_position = "top",
                },
            })
        end
    }
}
