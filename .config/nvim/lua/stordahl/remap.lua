-- Options
options = { noremap = true }

-- Escape with JK
vim.api.nvim_set_keymap("i", "jk", "<ESC>", options)

-- Leader Key
vim.g.mapleader = " "

-- Open netrw
--vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>Ex<CR>", options)

-- Switch Windows
vim.api.nvim_set_keymap("n", "<leader>w", "<c-w>w", options)

-- Detach Tmux
vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>lua os.execute('tmux detach')<CR>", options)

-- Toggle Markdown Preview
vim.api.nvim_set_keymap("n", "<leader>md", "<cmd>MarkdownPreviewToggle<cr>", options)

-- LSP Restart
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>LspRestart<cr>", options)

-- LazyGit
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>LazyGit<cr>", options)

-- GitSigns
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", options)
