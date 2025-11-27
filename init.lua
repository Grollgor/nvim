-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 5

vim.o.mouse = "a"
vim.o.showmode = false
vim.o.signcolumn = "yes"

vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2

vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<left>", "<cmd>echo 'Use h to move!!'<CR>")
vim.keymap.set("n", "<right>", "<cmd>echo 'Use l to move!!'<CR>")
vim.keymap.set("n", "<down>", "<cmd>echo 'Use j to move!!'<CR>")
vim.keymap.set("n", "<up>", "<cmd>echo 'Use k to move!!'<CR>")

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("grollgor-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

require("config.lazy")
require("lsp")
