-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v", "i" }, "<C-a>", "<Esc>gg0vG$<CR>")
vim.keymap.set("n", "<C-s>", "<Esc>:w<CR>")
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>v")
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a")

vim.keymap.set({ "n", "i" }, "<S-Up>", "<Esc>v<Up>")
vim.keymap.set({ "n", "i" }, "<S-Down>", "<Esc>v<Down>")
vim.keymap.set({ "n", "i" }, "<S-Left>", "<Esc>v<Left>")
vim.keymap.set({ "n", "i" }, "<S-Right>", "<Esc>v<Right>")

vim.keymap.set("i", "<S-Tab>", "<Esc><<CR>i")

vim.keymap.set("n", "<space><space>", "<CMD>Telescope<CR>", { desc = "telescope" })

vim.keymap.set("n", "<space>|", "<CMD>vsplit<CR><CMD>terminal<CR>", { desc = "vertical terminal" })
vim.keymap.set("n", "<space>-", "<CMD>split<CR><CMD>terminal<CR>", { desc = "horizotal terminal" })


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


vim.keymap.set("n", "<leader>xp", "<Nop>", { desc = "+peek (Telescope)" })
vim.keymap.set("n", "<leader>xpt", "<cmd>Telescope lsp_type_definitions<CR>",
    { desc = "type definitions" })
vim.keymap.set("n", "<leader>xpd", "<cmd>Telescope lsp_definitions<CR>",
    { desc = "definitions" })
vim.keymap.set("n", "<leader>xpp", "<cmd>Telescope lsp_implementations<CR>",
    { desc = "implementations" })
vim.keymap.set("n", "<leader>xpr", "<cmd>Telescope lsp_references<CR>",
    { desc = "references" })
vim.keymap.set("n", "<leader>xpo", "<cmd>Telescope lsp_outgoing_calls<CR>",
    { desc = "outgoing" })
vim.keymap.set("n", "<leader>xpi", "<cmd>Telescope lsp_incoming_calls<CR>",
    { desc = "incoming" })
vim.keymap.set("n", "<leader>xpq", "<cmd>Telescope quickfix<CR>",
    { desc = "quickfix" })
vim.keymap.set("n", "<leader>xpw", "<cmd>Telescope diagnostics<CR>",
    { desc = "workspace diagnostics" })
vim.keymap.set("n", "<leader>xpb", "<cmd>Telescope diagnostics bufnr=0",
    { desc = "buffer diagnostics" })
vim.keymap.set("n", "<leader>xps", "<cmd>Telescope lsp_document_symbols<cr>",
    { desc = "document symbols" })
vim.keymap.set("n", "<leader>xpS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    { desc = "dynamic workspace symbols" })


vim.keymap.set("n", "<leader>cg", "<Nop>", { desc = "+golang" })
vim.keymap.set("n", "<leader>cp", "<Nop>", { desc = "+python" })

vim.keymap.set("n", "<leader>::",
    function()
        vim.opt.cmdheight = 1 - vim.opt.cmdheight._value
    end,
    { desc = "Toggle cmdheight" }
)
