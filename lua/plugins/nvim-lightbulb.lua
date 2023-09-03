-- if true then return {} end
return {
    {
        'kosayoda/nvim-lightbulb',
        opts = function(_, opts)
            opts.number = {
                enabled = true,
                -- Highlight group to highlight the number column if there is a lightbulb.
                hl = "LightBulbNumber",
            }

            -- 6. Content line.
            opts.line = {
                enabled = true,
                -- Highlight group to highlight the line if there is a lightbulb.
                hl = "LightBulbLine",
            }

            -- Autocmd configuration.
            -- If enabled, automatically defines an autocmd to show the lightbulb.
            -- If disabled, you will have to manually call |NvimLightbulb.update_lightbulb|.
            -- Only works if configured during NvimLightbulb.setup
            opts.autocmd = {
                -- Whether or not to enable autocmd creation.
                enabled = true,
                -- See |updatetime|.
                -- Set to a negative value to avoid setting the updatetime.
                updatetime = 50,
                -- See |nvim_create_autocmd|.
                events = { "CursorHold", "CursorHoldI" },
                -- See |nvim_create_autocmd| and |autocmd-pattern|.
                pattern = { "*" },
            }
        end
    }
}
