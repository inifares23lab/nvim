return {
    {
        "Dhanus3133/Leetbuddy.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        config = function()
            require("leetbuddy").setup({})
            vim.keymap.set("n", "<leader>n", "<Nop>", { desc = "+leetbuddy" })
            vim.keymap.set("n", "<leader>nl", "<cmd>LBQuestions<cr>", { desc = "List Questions" })
            vim.keymap.set("n", "<leader>nv", "<cmd>LBQuestion<cr>", { desc = "View Question" })
            vim.keymap.set("n", "<leader>nr", "<cmd>LBReset<cr>", { desc = "Reset Code" })
            vim.keymap.set("n", "<leader>nt", "<cmd>LBTest<cr>", { desc = "Run Code" })
            vim.keymap.set("n", "<leader>ns", "<cmd>LBSubmit<cr>", { desc = "Submit Code" })
        end,
    },
}
