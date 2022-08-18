
require('neorg').setup {
  load = {
    ['core.defaults'] = {},
    ['core.norg.concealer'] = {
      config = {
        icon_preset = 'diamond',
      },
    },
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          gtd   = '~/neorg_gtd',
          neorg = '~/neorg',
        },
      },
    },
    ['core.gtd.base'] = {
      config = {
        workspace = 'gtd',
      },
    },
    ['core.presenter'] = {
      config = {
        zen_mode = 'truezen',
      },
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
    ['core.keybinds'] = {
      config = {
        default_keybinds = true,
        neorg_leader = '<leader>o',
      },
    },
    ['core.integrations.nvim-cmp'] = {},
    ['core.integrations.telescope'] = {},
    ['core.norg.journal'] = {},
    ['core.norg.qol.toc'] = {},
  },
}

-- vim: ts=2 sw=2 et
