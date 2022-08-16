
local g = vim.g

local disable_plugins = function()
  -- g.loaded_matchit         = 1
  -- g.loaded_matchparen      = 1
  g.loaded_2html_plugin      = 1
  g.loaded_getscript         = 1
  g.loaded_getscriptPlugin   = 1
  g.loaded_gzip              = 1
  g.loaded_logiPat           = 1
  g.loaded_netrw             = 1
  g.loaded_netrwFileHandlers = 1
  g.loaded_netrwPlugin       = 1
  g.loaded_netrwSettings     = 1
  g.loaded_rrhelper          = 1
  g.loaded_tar               = 1
  g.loaded_tarPlugin         = 1
  g.loaded_tutor_mode_plugin = 1
  g.loaded_vimball           = 1
  g.loaded_vimballPlugin     = 1
  g.loaded_zip               = 1
  g.loaded_zipPlugin         = 1
end

local disable_providers = function()
  g.loaded_node_provider = 0
  g.loaded_perl_provider = 0
  g.loaded_ruby_provider = 0
end

disable_plugins()
disable_providers()

require('core.options')
require('core.keymaps')
