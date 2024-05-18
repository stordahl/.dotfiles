local builtin = require('telescope.builtin')

vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", options)
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", options)
vim.keymap.set("n", "<leader>g", function ()
  builtin.grep_string({ search = vim.fn.input("grep :")})
end)
