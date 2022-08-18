
local actions = require('fzf-lua.actions')

require('fzf-lua').setup {
  --
  winopts = {

  },
  keymap = {

  },
  actions = {
    files = {
      ['default'] = actions.files_edit,
    },
  }
}
