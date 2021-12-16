require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'go',
    'json',
    'json5',
    'jsonc',
    'lua',
    'make',
    'markdown',
    'python',
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    linter_events = {'BufWrite', 'CursorHold'},
  },
}

-- vim: ts=2 sw=2 et:
