local defaultOpts = require("stordahl.remap")

vim.api.nvim_set_keymap("n", "<leader>ha", "<cmd>lua require('harpoon.mark').add_file()<cr>", defaultOpts)
vim.api.nvim_set_keymap("n", "<leader>hr", "<cmd>lua require('harpoon.mark').rm_file()<cr>", defaultOpts)
vim.api.nvim_set_keymap("n", "<leader>hv", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", defaultOpts)
vim.api.nvim_set_keymap("n", "<leader>hn", "<cmd>lua require('harpoon.ui').nav_next()<cr>", defaultOpts)
vim.api.nvim_set_keymap("n", "<leader>hp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", defaultOpts)

