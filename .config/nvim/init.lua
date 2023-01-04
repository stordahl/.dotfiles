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
-- Relative Line Numbers
vim.wo.number = true
-- Use System Clipboard
vim.o.clipboard = "unnamedplus"
--Term GUI Colors
vim.o.termguicolors = true

--vim.opt.wrap = false

if(vim.bo.filetype == 'markdown') then
  vim.opt_local.wrap = true
else
  vim.opt_local.wrap = false
end

