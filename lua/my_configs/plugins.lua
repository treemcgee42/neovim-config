local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Status line (Galaxy Line)
  use 'kyazdani42/nvim-web-devicons'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

--  use({
--    "NTBBloodbath/galaxyline.nvim",
--    -- your statusline
--    config = function()
--      require("galaxyline.themes.eviline")
--    end,
--    -- some optional icons
--    requires = { "kyazdani42/nvim-web-devicons", opt = false }
--  })


  -- LSP 
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'
  use 'deoplete-plugins/deoplete-clang'

  -- Syntax highlighting
  use {
     'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate'
  }
  -- use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'justinmk/vim-syntax-extra'
  -- use 'octol/vim-cpp-enhanced-highlight'

  -- Autocompletion
  use 'ms-jpq/coq_nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'dcampos/nvim-snippy'
	  
  use 'dcampos/cmp-snippy'

  -- use 'Shougo/deoplete.nvim'

  -- Formatting
  use "lukas-reineke/lsp-format.nvim"
  use "windwp/nvim-autopairs"

  -- Color themes
  use 'folke/tokyonight.nvim'
  use({
	"catppuccin/nvim",
	as = "catppuccin"
  })
  use { "ellisonleao/gruvbox.nvim" }

  -- Tabs
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function() require'nvim-tree'.setup {} end
  }

  use {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  -- Terminal integration
  use "numToStr/FTerm.nvim"

  -- Diagnostics
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        
      }
    end
  }

  -- other
  use 'lervag/vimtex'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
  
  use { 'echasnovski/mini.sessions', branch = 'stable' }
  use { 'echasnovski/mini.starter', branch = 'stable' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
