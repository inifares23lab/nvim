return {
    {
        "echasnovski/mini.move",
        version = "*",
        config = function()
            require('mini.move').setup({
                    mappings = {
                        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                        left = '<A-Left>',
                        right = '<A-Right>',
                        down = '<A-Down>',
                        up = '<A-Up>',

                        -- Move current line in Normal mode
                        line_left = '<A-Left>',
                        line_right = '<A-Right>',
                        line_down = '<A-Down>',
                        line_up = '<A-Up>',
                    },
                })
        end
    }
}
