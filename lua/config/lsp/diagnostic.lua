-- vim: ts=2 sw=2 et

vim.diagnostic.config {
  underline = true,
  virtual_text = {
    source = 'always',
    spacing = 5,
    prefix = ' ',
  },
  signs = true,
  update_in_insert = false,
}

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = 'rounded',
    close_events = {'CursorMoved', 'BufHidden', 'InsertCharPre'},
  }
)

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = 'rounded',
  }
)

-- Define Signs For LSP
vim.fn.sign_define('DiagnosticSignError', {
    text   = ' ',
    texthl = 'DiagnosticsSignError',
    numhl  = 'DiagnosticsSignError'
  }
)

vim.fn.sign_define('DiagnosticSignWarning', {
    text   = ' ',
    texthl = 'DiagnosticsSignWarning',
    numhl  = 'DiagnosticsSignWarning'
  }
)

vim.fn.sign_define('DiagnosticSignInformation', {
    text   = ' ',
    texthl = 'DiagnosticsSignInformation',
    numhl  = 'DiagnosticsSignInformation'
  }
)

vim.fn.sign_define('DiagnosticSignHint', {
    text   = ' ',
    texthl = 'DiagnosticsSignHint',
    numhl  = 'DiagnosticsSignHint'
  }
)

