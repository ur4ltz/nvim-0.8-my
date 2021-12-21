local which_key = require('which-key')

local setup = {
  window = {
    -- border = 'rounded',
    position = 'bottom',
  },
}

local opts = {
  mode    = 'n',
  prefix  = '<leader>',
  buffer  = nil,
  silent  = true,
  noremap = true,
  nowait  = true,
}

local mappings = {
  ['e'] = {'<cmd>NvimTreeToggle<cr>', 'Explorer'},
  ['w'] = {'<cmd>w<cr>', 'Write'},
  ['q'] = {'<cmd>q<cr>', 'Quit'},
  p = {
    name = 'Packer',
    c = {'<cmd>PackerCompile<cr>', 'Compile'},
    i = {'<cmd>PackerInstall<cr>', 'Install'},
    s = {'<cmd>PackerSync<cr>',    'Sync'},
    S = {'<cmd>PackerStatus<cr>',  'Status'},
    u = {'<cmd>PackerUpdate<cr>',  'Update'},
  },
  g = {
    name = 'Git',
    t = {'<cmd>lua _TIG_TOGGLE()<cr>',      'Tig'},

    o = {'<cmd>Telescope git_status<cr>',   'Open changed files'},
    b = {'<cmd>Telescope git_branches<cr>', 'Checkout branch'},
    c = {'<cmd>Telescope git_commits<cr>',  'Checkout commit'},
  },
  l = {
    name = 'LSP',

    i = {'<cmd>LspInfo<cr>', 'Info'},
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)

-- vim: ts=2 sw=2 et: