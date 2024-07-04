local utils = require("stordahl.utils")

-- Options
DefaultOptions = { noremap = true }

-- Leader Key
vim.g.mapleader = " "

-- Escape with JK
vim.api.nvim_set_keymap("i", "jk", "<ESC>", utils.merge(DefaultOptions, { desc = "escape" }))

-- Switch Windows
vim.api.nvim_set_keymap("n", "<leader>w", "<c-w>w", utils.merge(DefaultOptions, { desc = "switch windows" }))

-- Detach Tmux
vim.api.nvim_set_keymap("n", "<leader>td", "<cmd>lua os.execute('tmux detach')<CR>", utils.merge(DefaultOptions, { desc = "detach from current tmux session" }))

-- Toggle Markdown Preview
vim.api.nvim_set_keymap("n", "<leader>md", "<cmd>MarkdownPreviewToggle<cr>", utils.merge(DefaultOptions, { desc = "preview markdown" }))

-- LSP Restart
vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>LspRestart<cr>", utils.merge({ noremap = true , desc = "restart LSP" }))

-- GitSigns
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", utils.merge({ noremap = true , desc = "git blame inline" }))

-- Search Keymaps
vim.api.nvim_set_keymap("n", "<leader>kk", "<cmd>Telescope keymaps<cr>", utils.merge({ noremap = true , desc = "search keymaps" }))

return DefaultOptions
