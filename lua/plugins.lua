-- vim: ts=2 sw=2 et:

local function install_packer()
  -- local fn = vim.fn
  local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd('packadd packer.nvim')
  end
  vim.cmd('packadd packer.nvim')
end

install_packer()

local packer = require('packer')

packer.init {
  auto_clean = true,
  max_jobs = 2,
  display = {
    open_cmd = 'topleft 80vnew [packer]',
  },
  git = {
    clone_timeout = 360,
  },
}

packer.startup(function()
  use {'wbthomason/packer.nvim', opt = true}

  use {
    'ellisonleao/gruvbox.nvim',
    requires = {'rktjmp/lush.nvim'},
  }

  use {'kyazdani42/nvim-web-devicons'}

  use {'onsails/lspkind-nvim'}

  use {
    'goolord/alpha-nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('config.alpha')
    end,
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      require('config.tree')
    end,
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'nvim-treesitter/playground',
      'p00f/nvim-ts-rainbow',
    },
    config = function()
      require('config.treesitter')
    end,
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('config.indent-blankline')
    end,
  }

  use {'ray-x/lsp_signature.nvim'}

  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lsp')
    end,
  }

  use {
    'stevearc/aerial.nvim',
    config = function()
      require('config.aerial')
    end,
  }

  use {
    'ldelossa/calltree.nvim',
    config = function ()
      require('config.calltree')
    end
  }

  use {'L3MON4D3/LuaSnip'}

  -- use {'rafamadriz/friendly-snippets'}

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      -- 'hrsh7th/cmp-vsnip',
      -- 'hrsh7th/vim-vsnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require('config.nvim-cmp')
    end,
  }

  use {
    'rafcamlet/nvim-luapad',
    ft = 'lua',
    config = function()
      require('config.luapad')
    end,
  }
  use {
    'SmiteshP/nvim-gps',
    config = function()
      require('config.nvim-gps')
    end,
  }

    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsigns')
    end,
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('config.lualine')
    end,
  }

  use {
    'rmagatti/auto-session',
    config = function()
      require('config.auto-session')
    end,
  }

  use {
    'rmagatti/session-lens',
    config = function()
      require('session-lens').setup()
    end,
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require('config.toggleterm')
    end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('config.telescope')
    end,
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('config.colorizer')
    end,
  }

end)
