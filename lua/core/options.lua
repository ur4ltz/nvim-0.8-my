
-- inspired by @rafamadriz
--   https://github.com/rafamadriz/dotfiles

vim.g.mapleader      = ' '
vim.g.maplocalleader = ' '

vim.opt.mouse        = 'n'
vim.opt.wrap         = false

vim.opt.clipboard    = 'unnamedplus'

--------------------------------------------------------------------------------
-- Display
--------------------------------------------------------------------------------
vim.opt.laststatus    = 3
vim.opt.signcolumn    = 'yes'
vim.opt.showbreak     = [[↪ ]] -- Options include -> '…', '↳ ', '→','↪ '
vim.opt.termguicolors = true
vim.opt.cursorline    = true
vim.opt.number        = true
vim.opt.numberwidth   = 1

--------------------------------------------------------------------------------
-- List Chars
--------------------------------------------------------------------------------
vim.opt.list      = true
vim.opt.listchars = {
    trail    = "•",
    -- eol      = "↴",
    tab      = "» ",
    extends  = "❯",
    precedes = "❮",
    nbsp     = "_",
    space    = " ",
}

--------------------------------------------------------------------------------
-- Search and Complelete
--------------------------------------------------------------------------------
vim.opt.incsearch   = true
vim.opt.ignorecase  = true
vim.opt.smartcase   = true

vim.opt.completeopt = 'menuone,noinsert,noselect'

-- vim.opt.spell        = true
vim.opt.spelllang    = {'en_us'}

--------------------------------------------------------------------------------
-- Backup / Undo / Swap
--------------------------------------------------------------------------------
vim.opt.backup   = true
vim.opt.undofile = true
vim.opt.swapfile = true


