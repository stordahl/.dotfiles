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
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
    opts = {
      -- add any opts here
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below is optional, make sure to setup it properly if you have lazy=true
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
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
  {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
},
{
  "lervag/vimtex",
  lazy = false,     -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "zathura"
  end
}
})
