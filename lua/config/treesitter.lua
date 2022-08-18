require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'bash',
    'c',
    'cmake',
    'comment', -- Comment tags like TODO, FIXME, NOTE:  ...
    'commonlisp',
    'cpp',
    'css',
    'fennel',
    'go',
    'html',
    'json',
    'json5',
    'jsonc',
    'lua',
    'make',
    'markdown_inline',
    'ninja',
    'norg',
    'pascal',
    'perl',
    'python',
    'query',
    'regex',
    'ruby',
    'rust',
    'todotxt',
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
    disable = {
      'python'
    },
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
    linter_events = {'BufWrite', 'CursorHold', 'CursorMoved'},
  },
}

-- vim: ts=2 sw=2 et:
