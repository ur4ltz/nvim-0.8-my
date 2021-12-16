
local telescope = require('telescope')
local actions   = require('telescope.actions')

telescope.setup{
  defaults = {
    color_devicons = true,
    set_env = {COLORTERM = 'truecolor'}
  },
}
-- vim: ts=2 sw=2 et:
