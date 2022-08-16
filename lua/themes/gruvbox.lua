
require('gruvbox').setup({
  undercurl            = true,
  underline            = true,
  bold                 = true,
  italic               = true,
  inverse              = false,
  invert_selection     = false,
  invert_signs         = false,
  invert_tabline       = false,
  invert_intend_guides = false,
  contrast             = 'hard', -- 'hard' or 'soft'
  overrides = {
    -- SignColumn = {bg = '#ff9900'}
  },
})

vim.o.background = 'dark' -- 'dark' or 'light'

vim.cmd('colorscheme gruvbox')

-- vim.cmd('colorscheme github_dark')

