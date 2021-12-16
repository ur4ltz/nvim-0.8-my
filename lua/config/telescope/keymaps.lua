local keymap = vim.api.nvim_set_keymap

local opt = {noremap = true}

keymap('n', '<leader><leader>', '<cmd>Telescope buffers<CR>', {noremap = true})

keymap('n', '<leader>ff', '<cmd>Telescope find_files<CR>', opt)
keymap('n', '<leader>fg', '<cmd>Telescope git_files<CR>', opt)

-- vim: ts=2 sw=2 et:
