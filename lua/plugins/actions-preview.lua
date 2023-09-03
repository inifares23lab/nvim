return {
    {
        "aznhe21/actions-preview.nvim",
        config = function()
            vim.keymap.set(
                { "v", "n" },
                "<Leader>a",
                require("actions-preview").code_actions,
                { desc = "Actions preview"}
            )
        end,
    }
}
