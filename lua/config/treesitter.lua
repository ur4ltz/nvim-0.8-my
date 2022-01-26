require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'c',
    'comment',
    'cpp',
    'css',
    'go',
    'html',
    'json',
    'json5',
    'jsonc',
    'lua',
    'make',
    'markdown',
    'pascal',
    'perl',
    'python',
    'query',
    'regex',
    'ruby',
    'rust',
    'toml',
    'vim',
    'yaml',
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
    max_file_lines = nil,
  },
  query_linter = {
    enable = true,
    use_virtual_text = true,
    linter_events = {'BufWrite', 'CursorHold'},
  },
}

-- vim: ts=2 sw=2 et:
