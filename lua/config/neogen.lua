
require('neogen').setup{
  enabled = true,
  snippet_engine = 'luasnip',
  languages = {
    template = {
      annotation_convention = 'emmylua',
    },
  },
}

vim.api.nvim_set_keymap('n', '<leader>n', "<cmd>lua require('neogen').generate()<cr>", {noremap = true})

