return {
    {
        "Dhanus3133/Leetbuddy.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("leetbuddy").setup({
                domain = "com",
                language = "py",
            })
            local listwithcmd = function()
                vim.cmd("LBQuestions")
                vim.notify([[
    <A-r>: Reset all filters and display all problems.
    <A-e>: Display only easy difficulty problems.
    <A-m>: Display only medium difficulty problems.
    <A-h>: Display only hard difficulty problems.
    <A-a>: Display only problems with a status of "Accepted" (AC).
    <A-y>: Display only problems with a status of "Not Started" (NOT_STARTED).
    <A-t>: Display only problems with a status of "Tried" (TRIED).
]])
            end
            vim.keymap.set("n", "<leader>n", "<Nop>", { desc = "+leetbuddy" })
            vim.keymap.set("n", "<leader>nl", function() listwithcmd() end, { desc = "List Questions" })
            vim.keymap.set("n", "<leader>nv", "<cmd>LBQuestion<cr>", { desc = "View Question" })
            vim.keymap.set("n", "<leader>nr", "<cmd>LBReset<cr>", { desc = "Reset Code" })
            vim.keymap.set("n", "<leader>nt", "<cmd>LBTest<cr>", { desc = "Run Code" })
            vim.keymap.set("n", "<leader>ns", "<cmd>LBSubmit<cr>", { desc = "Submit Code" })
        end,
    },
}
