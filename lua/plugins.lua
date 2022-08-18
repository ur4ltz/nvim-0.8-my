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
    title = 'Packer',
    done_sym = '',
    error_sym = '×',
    prompt_border = 'rounded',
    keybindings = {
      toggle_info = '<Tab>',
      -- diff = '<cr>',
    },
  },
  git = {
    clone_timeout = 360,
  },
}

packer.startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  use {'lewis6991/impatient.nvim'}

  use {
    disable = true,
    'MunifTanjim/exrc.nvim',
    config = function()
      require('exrc').setup({
        files = {
          '.nvimrc.lua',
          '.nvimrc',
          '.exrc',
        },
      })
    end,
  }

  use {'ellisonleao/gruvbox.nvim'}

  use {'projekt0n/github-nvim-theme'}

  use {'navarasu/onedark.nvim'}

  use {'kyazdani42/nvim-web-devicons'}

  use {'onsails/lspkind-nvim'}

  use {
    'stevearc/dressing.nvim',
    config = function()
      require('config.dressing')
    end,
  }

  use {
    'goolord/alpha-nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require('config.alpha')
    end,
  }

  use {
    'mbbill/undotree',
    cmd = 'UndotreeToggle',
    config = function()
      require('config.undotree')
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
    -- disable = true,
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
    config = function()
      require('config.neo-tree')
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

  use {'weilbith/nvim-code-action-menu'}

  use {
    'simrat39/symbols-outline.nvim',
    -- 'zeertzjq/symbols-outline.nvim',
    -- branch = 'patch-1',
    cmd = 'SymbolsOutline',
    config = function()
      require('symbols-outline').setup()
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
    'L3MON4D3/LuaSnip',
    config = function()
      require('config.snippets')
    end,
  }

  -- use {'rafamadriz/friendly-snippets'}

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('config.comments')
    end,
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('config.auto-pairs')
    end,
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-calc',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'petertriho/cmp-git',
      {
        'petertriho/cmp-git',
        requires = {'nvim-lua/plenary.nvim'},
        config = function()
          require('cmp_git').setup({filetypes = {'gitcommit', 'NeogitCommitMessage'}})
        end,
      },
    },
    config = function()
      require('config.nvim-cmp')
    end,
  }

  use {
    'rafcamlet/nvim-luapad',
    requires = {
      'antoinemadec/FixCursorHold.nvim'
    },
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

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('config.gitsigns')
    end,
  }

  use {
    'sindrets/diffview.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('config.diffview')
    end,
  }

  use {
    disable = true,
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require('config.lualine')
    end,
  }

  use {
    'feline-nvim/feline.nvim',
    config = function()
      -- require('config.feline')
      require('feline').setup()
      require('feline').winbar.setup()
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
    requires = {
      'rmagatti/auto-session',
      'nvim-telescope/telescope.nvim'
    },
    config = function()
      require('session-lens').setup {
        path_display = {'shorten'},
        theme_conf = {border = true},
        previewer = true,
      }
    end,
  }

  use {
    'akinsho/toggleterm.nvim',
    config = function()
      require('config.toggleterm')
    end,
  }

  use {'vifm/vifm.vim'}

  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      require('octo').setup()
    end,
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-packer.nvim',
      'nvim-telescope/telescope-project.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      'benfowler/telescope-luasnip.nvim',
      'LinArcX/telescope-env.nvim',
    },
    config = function()
      require('config.telescope')
    end,
  }

  use {
    'AckslD/nvim-neoclip.lua',
    requires = {
      {'kkharji/sqlite.lua', module = 'sqlite'},
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('config.neoclip')
    end,
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('config.colorizer')
    end,
  }

  use {
    'https://gitlab.com/yorickpeterse/nvim-pqf',
    config = function()
      require('pqf').setup()
    end,
  }

  use {
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
    config = function()
      require('config.bqf')
    end,
  }

  use {
    'folke/trouble.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require('config.trouble')
    end,
  }

  use {
    -- disable = true,
    'folke/todo-comments.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('config.todo-comments')
    end,
  }

  use {
    'folke/which-key.nvim',
    config = function()
      require('config.whichkey')
    end,
  }

  use {
  -- Translate engine
  use {'potamides/pantran.nvim'}

  use {
    'rcarriga/nvim-notify',
    config = function()
      require('config.nvim-notify')
    end,
  }

    'ibhagwan/fzf-lua',
    requires  = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function()
      require('config.fzf')
    end,
  }

  use {
    'amrbashir/nvim-docs-view',
    opt = true,
    cmd = { 'DocsViewToggle' },
    config = function()
      require('docs-view').setup({
        position = 'right',
        width = 60,
      })
    end,
  }

  use {
    'danymat/neogen',
    requires = {
      'nvim-treesitter/nvim-treesitter'
    },
    config = function()
      require('config.neogen')
    end,
  }

  use {
    'nvim-neorg/neorg',
    requires = {
      'nvim-neorg/neorg-telescope',
      'danymat/neorg-gtd-things',
    },
    config = function ()
      require('config.neorg')
    end,
  }

  use {
    'nvim-orgmode/orgmode',
    config = function()
      require('config.orgmode')
    end,
  }

  use {'junegunn/vim-easy-align', opt = true, cmd = 'EasyAlign'}

  use {'nanotee/luv-vimdocs'}

  use {'milisims/nvim-luaref'}

end)
