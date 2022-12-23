-- Options
options = { noremap = true }

-- Basics
-- Leader Key
vim.g.mapleader = " "
-- Switch Windows
vim.api.nvim_set_keymap("n", "<leader>w", "<c-w>w", options)

--Harpoon
vim.api.nvim_set_keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>hv", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", options)
--for i=9,1,1 do
  --vim.api.nvim_set_keymap("n", "<leader>h1", "<cmd>lua require('harpoon.ui').nav_file(i)<cr>", options)
--end

-- Neo-tree
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>Neotree focus<cr>", options)
vim.api.nvim_set_keymap("n", "<esc>", "<cmd>Neotree close<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Neotree float git_status<cr>", options)

-- Packer
vim.api.nvim_set_keymap("n", "<leader>u", "<cmd>PackerSync<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>i", "<cmd>PackerInstall<cr>", options)

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", options)
