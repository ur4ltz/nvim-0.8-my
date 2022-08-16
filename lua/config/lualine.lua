local gps = require('nvim-gps')

local hide_in_width = function(width)
  return function()
    return vim.fn.winwidth(0) > width
  end
end

local gps_hide_in_width = function()
  return gps.is_available() and hide_in_width(90)()
end

local branch = {
  'branch',
  cond = hide_in_width(80)
}

local diagnostics = {
  'diagnostics',
  sources = {'nvim_diagnostic'},
  -- sections = {'error', 'warn'},
  symbols = { error = " ", warn = " ", info = " " },
  colored = true,
  update_in_insert = false,
  cond = hide_in_width(80)
}

local gps_comp = {
  gps.get_location,
  cond = gps_hide_in_width
}

local diff = {
  'diff',
  symbols = { added = "", modified = "", removed = "" },
  cond = hide_in_width(100)
}

local filetype = {
  'filetype',
  cond = hide_in_width(100)
}

local progress = {
  'progress',
  cond = hide_in_width(100)
}

local location = {
  'location',
  cond = hide_in_width(40)
}

local function attached_lsp()
  local clients = vim.lsp.get_active_clients()
  if #clients > 0 then
    return clients[1].name
  end
  return ''
end

local active_lsp = {
  attached_lsp,
  icon = '',
  cond = function() return #vim.lsp.get_active_clients() > 0 and hide_in_width(100)() end
}

require('lualine').setup {
  options = {
    theme = 'powerline', -- 'wombat molokai '
    -- section_separators = { left = '', right = ''},
    -- component_separators = { left = '', right = ''}
    section_separators = {left = '', right = ''},
    component_separators = {left = '|', right = '|'},
    disabled_filetypes = {'neo-tree', 'symbols-outline', 'toggleterm'},     -- Filetypes to disable lualine for.
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {branch, 'filename'},
    lualine_c = {active_lsp, diagnostics, gps_comp},
    lualine_x = {diff, filetype, 'fileformat' },
    lualine_y = {location},
    lualine_z = {progress}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {location},
    lualine_y = {},
    lualine_z = {}
  },
}
-- vim: ts=2 sw=2 et:
