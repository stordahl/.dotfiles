local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function (use)
  -- Packer
  use "wbthomason/packer.nvim"

 	use { -- LSP Configuration & Plugins
  	'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }

	-- DAP
	use {
		'mfussenegger/nvim-dap',
		requires = {
			'rcarriga/nvim-dap-ui',
			'ldelossa/nvim-dap-projects'
		}
	}

  -- LuaSnip
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  use { 'hrsh7th/nvim-cmp',
    config = function ()
      require'cmp'.setup {
        snippet = {
          expand = function(args)
            require'luasnip'.lsp_expand(args.body)
          end
        },
        sources = {
          { name = 'luasnip' },
          { name = 'nvim_lsp' }
        },
      }
    end
  }
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "stordahl/sveltekit-snippets"

  -- Catppuccino
  use { "catppuccin/nvim", as = "catppuccin" } 

  -- Feline
  use 'feline-nvim/feline.nvim'

  -- Auto Pairs
  use 'windwp/nvim-autopairs'

  -- Git signs
  use 'lewis6991/gitsigns.nvim'

  -- Harpoon
  use 'ThePrimeagen/harpoon'

  -- Neo-tree
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Terminal
  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
			direction = "float",
			float_opts = {
    		border = "curved",
    		highlights = {
      		border = "Normal",
      		background = "Normal",
    		},
  		},
    })
  end}

  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
