-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt_global.cursorcolumn = true
vim.opt_global.colorcolumn = "80,120,121,122,123,124,125,126,127,128,129"

vim.opt_global.tabstop = 4
vim.opt_global.shiftwidth = 4
vim.opt_global.expandtab = true

-- vim.opt_global.foldmethod = "indent"
vim.opt_global.foldlevelstart = 99
vim.opt_global.foldmethod = "expr"
vim.opt_global.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt_global.relativenumber = false

vim.opt_global.swf = false

vim.opt_global.showtabline = 2

-- vim.opt_global.cmdheight = 0
