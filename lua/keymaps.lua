
local nopt = {silent = true, noremap = true}

local keymap = vim.api.nvim_set_keymap

-- Normal mode
keymap('n', '<C-Left>',  '<C-w>h', nopt)
keymap('n', '<C-Down>',  '<C-w>j', nopt)
keymap('n', '<C-Up>',    '<C-w>k', nopt)
keymap('n', '<C-Right>', '<C-w>l', nopt)

-- Move line Up / Down
keymap('n', '<A-j>', ':m .+1<CR>==', nopt)
keymap('n', '<A-k>', ':m .-2<CR>==', nopt)

-- Visual mode
-- Stay in indent mode
keymap('v', '<', '<gv', nopt)
keymap('v', '>', '>gv', nopt)

keymap('x', '<A-j>', ":move '>+1<CR>gv-gv", nopt)
keymap('x', '<A-k>', ":move '<-2<CR>gv-gv", nopt)


keymap('n', '<F3>', '<cmd>NvimTreeToggle<CR>', nopt)

