-- Global requires
require('plugins')
require('mappings')
require('theme')
require('commands')

-- Sets
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
-- Relative Line Numbers
vim.wo.number = true
-- Use System Clipboard
vim.o.clipboard = "unnamedplus"
--Term GUI Colors
vim.o.termguicolors = true


