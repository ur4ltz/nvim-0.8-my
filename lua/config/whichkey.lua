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
  ['m'] = {'<cmd>lua _VIFM_TOGGLE()<cr>', 'ViFm'},
  ['q'] = {'<cmd>q<cr>', 'Quit'},
  ['u'] = {'<cmd>UndotreeToggle<cr>', 'UndoTree'},
  ['w'] = {'<cmd>w<cr>', 'Write'},
  ['/'] = {'<cmd>nohlsearch<cr>', 'Clear search highlight'},
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
    P = {'<cmd>Telescope packer<cr>',     'Packer'},
    p = {'<cmd>Telescope project<cr>',    'Projects'},
    k = {'<cmd>Telescope keymaps<cr>',    'Keymaps'},
  },
  p = {
    name = 'Packer',
    c = {'<cmd>PackerCompile<cr>', 'Compile'},
    C = {'<cmd>PackerClean<cr>',   'Clean'},
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
