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
  ['<leader>'] = {'<cmd>Telescope buffers<cr>', 'Buffers'},
  t = {
    name = 'Telescope',
    b = {'<cmd>Telescope buffers<cr>',    'Buffers'},
    c = {'<cmd>Telescope neoclip<cr>',    'Clipboard'},
    e = {'<cmd>Telescope env<cr>',        'Environment Variables'},
    f = {'<cmd>Telescope find_files<cr>', 'Find files'},
    g = {'<cmd>Telescope git_files<cr>',  'Git files'},
    h = {'<cmd>Telescope help_tags<cr>',  'Help tags'},
    l = {'<cmd>Telescope live_grep<cr>',  'Live grep'},
    r = {'<cmd>Telescope registers<cr>',  'Registers'},
    n = {'<cmd>Telescope notify<cr>',     'Notify'},
    p = {'<cmd>Telescope packer<cr>',     'Packer'},
    P = {'<cmd>Telescope project<cr>',    'Projects'},
  },
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
