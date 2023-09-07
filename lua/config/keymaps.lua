-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v", "i", "x", "s" }, "<C-a>", "<Esc>gg0vG$<CR>")
vim.keymap.set({ "n", "v", "i", "x", "s" }, "<C-s>", "<Esc>:w<CR>")

vim.keymap.set({ "n", "i" }, "<S-Up>", "<Esc>v<Up>")
vim.keymap.set({ "n", "i" }, "<S-Down>", "<Esc>v<Down>")
vim.keymap.set({ "n", "i" }, "<S-Left>", "<Esc>v<Left>")
vim.keymap.set({ "n", "i" }, "<S-Right>", "<Esc>v<Right>")

vim.keymap.set("i", "<S-Tab>", "<Esc><<CR>i")

vim.keymap.set("n", "<space>|", "<CMD>vsplit | terminal<CR>i", { desc = "vertical terminal" })
vim.keymap.set("n", "<space>-", "<CMD>split | terminal<CR>i", { desc = "horizotal terminal" })
vim.keymap.set("n", "<leader><Tab>t", "<CMD>tabnew | terminal<CR>i", { desc = "Terminal in new tab" })
vim.keymap.set({ "i", "v", "x", "s" }, "<C-/>", "<Esc><CMD>tabnew | terminal<CR>i", { desc = "Terminal in new tab" })

-- GROUPS
vim.keymap.set("n", "<leader>b", "<Nop>", { desc = "+buffer" })
vim.keymap.set("n", "<leader>c", "<Nop>", { desc = "+code" })
vim.keymap.set("n", "<leader>d", "<Nop>", { desc = "+debug" })
vim.keymap.set("n", "<leader>f", "<Nop>", { desc = "+file/find" })
vim.keymap.set("n", "<leader>g", "<Nop>", { desc = "+git" })
vim.keymap.set("n", "<leader>q", "<Nop>", { desc = "+quit/session" })
vim.keymap.set("n", "<leader>s", "<Nop>", { desc = "+search" })
vim.keymap.set("n", "<leader>t", "<Nop>", { desc = "+test" })
vim.keymap.set("n", "<leader>u", "<Nop>", { desc = "+ui" })
vim.keymap.set("n", "<leader>w", "<Nop>", { desc = "+window" })
vim.keymap.set("n", "<leader>x", "<Nop>", { desc = "+diagnostics/quickfix" })
vim.keymap.set("n", "<leader><Tab>", "<Nop>", { desc = "+tabs" })


vim.keymap.set("n", "<leader>dP", "<Nop>", { desc = "+class/method" })
vim.keymap.set("n", "<leader>sn", "<Nop>", { desc = "+noice" })


vim.keymap.set("n", "\\\\", ":")
vim.keymap.set("n", "\\l", ":lua ")


vim.keymap.set("n", "<leader>cg", "<Nop>", { desc = "+golang" })
vim.keymap.set("n", "<leader>cp", "<Nop>", { desc = "+python" })

