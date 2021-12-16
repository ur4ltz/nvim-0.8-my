-- vim: ts=2 sw=2 et:

require('indent_blankline').setup {
  char = '┊',
  buftype_exclude = {'terminal', 'nofile'},
  filetype_exclude = {'help', 'packer', 'Outline'},
  indent_blankline_use_treesitter = true,
  indent_blankline_show_current_context = true,
  show_first_indent_level = false,
}
