
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

require('auto-session').setup {
  auto_session_enable_last_session = false,
  auto_session_enabled             = true,
  auto_session_create_enabled      = false,
  auto_save_enabled                = nil,
  auto_restore_enabled             = nil,
  auto_session_suppress_dirs       = nil,
  auto_session_allowed_dirs        = nil,
  auto_session_use_git_branch      = nil,
}

