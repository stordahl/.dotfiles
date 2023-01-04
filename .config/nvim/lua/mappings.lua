-- Options
options = { noremap = true }

-- Basics
-- Escape with JK
vim.api.nvim_set_keymap("i", "jk", "<ESC>", options)
-- Leader Key
vim.g.mapleader = " "
-- Switch Windows
vim.api.nvim_set_keymap("n", "<leader>w", "<c-w>w", options)

-- Packer
vim.api.nvim_set_keymap("n", "<leader>u", "<cmd>PackerSync<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>i", "<cmd>PackerInstall<cr>", options)

