
local nopt = {silent = true, noremap = true}

local keymap = vim.api.nvim_set_keymap

-- Normal mode
-- Better window navigation
keymap('n', '<C-Left>',  '<C-w>h', nopt)
keymap('n', '<C-Down>',  '<C-w>j', nopt)
keymap('n', '<C-Up>',    '<C-w>k', nopt)
keymap('n', '<C-Right>', '<C-w>l', nopt)

-- Use Ctrl+Shift + 'Down Up Left Right' to move window
keymap('n', '<C-S-Left>',  '<C-w>H', nopt)
keymap('n', '<C-S-Down>',  '<C-w>J', nopt)
keymap('n', '<C-S-Up>',    '<C-w>K', nopt)
keymap('n', '<C-S-Right>', '<C-w>L', nopt)

-- Use alt + 'Down Up Left Right' to resize window
keymap('n', '<M-Down>',  '<Cmd>resize -2<CR>', nopt)
keymap('n', '<M-Up>',    '<Cmd>resize +2<CR>', nopt)
keymap('n', '<M-Left>',  '<Cmd>vertical resize -2<CR>', nopt)
keymap('n', '<M-Right>', '<Cmd>vertical resize +2<CR>', nopt)

-- Move line Up / Down
keymap('n', '<M-j>', ':m .+1<CR>==', nopt)
keymap('n', '<M-k>', ':m .-2<CR>==', nopt)

-- Visual mode
-- Stay in indent mode
keymap('v', '<', '<gv', nopt)
keymap('v', '>', '>gv', nopt)

keymap('x', '<M-j>', ":move '>+1<CR>gv-gv", nopt)
keymap('x', '<M-k>', ":move '<-2<CR>gv-gv", nopt)


