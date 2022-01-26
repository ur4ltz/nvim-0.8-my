
local onedark = require('onedark')

onedark.setup{
  style             = 'deep', -- dark, darker, cool, deep, warm, warmer, light
  transparent       = false,
  term_colors       = true,
  ending_tildes     = true,
  toggle_style_key  = '<leader>ct',
  toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}
}

onedark.load()

