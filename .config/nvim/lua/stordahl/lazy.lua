local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  },
  { -- LSP Configuration & Plugins
  	"neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      "j-hui/fidget.nvim",
    },
  },
    -- LuaSnip
  "L3MON4D3/LuaSnip",
  { "hrsh7th/nvim-cmp",
    config = function ()
      require"cmp".setup {
        snippet = {
          expand = function(args)
            require"luasnip".lsp_expand(args.body)
          end
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
        },
      }
    end
  },
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        columns = { "icon" },
        delete_to_trash = true,
        view_options = {
          show_hidden = true,
          natural_order = true,
        },
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
        }
      }

      vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", {})
    end
  },
  {
    "f-person/auto-dark-mode.nvim",
    config = {
      update_interval = 500,
      set_dark_mode = function()
        if vim.loop.os_uname().sysname == "Darwin" then
          vim.api.nvim_set_option("background", "dark")
        end
      end,
      set_light_mode = function()
        if vim.loop.os_uname().sysname == "Darwin" then
          vim.api.nvim_set_option("background", "light")
        end
      end,
    },
  },
  "nvim-lualine/lualine.nvim",
  "windwp/nvim-autopairs",
  "lewis6991/gitsigns.nvim",
  "ThePrimeagen/harpoon",
})
