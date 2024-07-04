local builtin = require("telescope.builtin")
local defaultOpts = require("stordahl.remap")
local utils = require("stordahl.utils")

vim.keymap.set("n", "<leader>ff", function ()
  builtin.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})
end, utils.merge(defaultOpts, { desc = "find files" }))

vim.keymap.set("n", "<leader>fg", function ()
  builtin.live_grep()
end, defaultOpts)

vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", defaultOpts)

vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", defaultOpts)

vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<cr>", defaultOpts)

vim.keymap.set("n", "<leader>g", function ()
  builtin.grep_string({ search = vim.fn.input("grep :")})
end, utils.merge(defaultOpts, { desc = "string grep"}))
