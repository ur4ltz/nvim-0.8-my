
-- local snippets_folder = vim.fn.stdpath 'config' .. '/lua/config/snippets/snippets'
local snippets_folder = vim.fn.stdpath 'config' .. './snippets/LuaSnip'
local ls              = require('luasnip')
local types           = require('luasnip.util.types')

ls.config.set_config({
  history = true,

  updateevents = 'TextChanged, TextChangedI',
  enable_autosnippets = false,

  store_selection_keys = '<C-q>',
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {{'●', 'GruvboxOrange'}},
      },
    },
    [types.insertNode] = {
      active = {
        virt_text = {{'●', 'GruvboxBlue'}},
      },
    },
  },
})

ls.filetype_extend('all', {'_'})

require('luasnip.loaders.from_vscode').lazy_load({paths = './snippets/VSCode'})
require('luasnip.loaders.from_snipmate').lazy_load({paths = './snippets/Snipmate'})
require('luasnip.loaders.from_lua').lazy_load({paths = snippets_folder})

