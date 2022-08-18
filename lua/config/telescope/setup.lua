
local telescope = require('telescope')
local actions   = require('telescope.actions')
local previewers = require('telescope.previewers')

telescope.setup{
  defaults = {
    color_devicons = true,
    set_env = {COLORTERM = 'truecolor'},
    vimgrep_arguments = {
      'ag',
      '--column',
      '--numbers',
      '--noheading',
      '--nocolor',
    },
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
  },
  pickers = {
  },
  extensions = {
  },
}

telescope.load_extension('packer')
telescope.load_extension('project')
telescope.load_extension('session-lens')
telescope.load_extension('env')
telescope.load_extension('luasnip')

-- vim: ts=2 sw=2 et:
