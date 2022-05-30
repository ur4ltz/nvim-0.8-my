
require('todo-comments').setup {
  signs = true,
  sign_priority = 8,
  keywords = {
    FIX = {
      icon = ' ',
      color = 'error',
      alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' },
    },
    TODO = {
      icon = ' ',
      color = 'info'
    },
    HACK = {
      icon = ' ',
      color = 'warning'
    },
    WARN = {
      icon = ' ',
      color = 'warning',
      alt = { 'WARNING', 'XXX' }
    },
    PERF = {
      icon = ' ',
      alt = { 'OPTIM', 'OPTIMIZE', 'PERFORMANCE' }
    },
    NOTE = {
      icon = ' ',
      color = 'hint',
      alt = { 'INFO' }
    },
  },
  search = {
    command = 'ag',
    args = {
      '--noheading',
      '--numbers',
      '--column'
    },
    pattern = [[\b(KEYWORDS):]], -- ag regex
  },
  highlight = {
    before = '',
    keyword = 'wide',
    after = '',
    pattern = [[.*(KEYWORDS)\s*:]],
    comments_only = true,
    max_line_len = 400,
    exclude = {},
  },
}

