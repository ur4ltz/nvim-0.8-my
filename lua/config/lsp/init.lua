-- vim: ts=2 sw=2 et

local nvim_lsp = require('lspconfig')

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
    texthl = 'LspDiagnosticsSignError',
    numhl  = 'LspDiagnosticsSignError'
  }
)

vim.fn.sign_define('DiagnosticSignWarning', {
    text   = ' ',
    texthl = 'LspDiagnosticsSignWarning',
    numhl  = 'LspDiagnosticsSignWarning'
  }
)

vim.fn.sign_define('DiagnosticSignInformation', {
    text   = ' ',
    texthl = 'LspDiagnosticsSignInformation',
    numhl  = 'LspDiagnosticsSignInformation'
  }
)

vim.fn.sign_define('DiagnosticSignHint', {
    text   = ' ',
    texthl = 'LspDiagnosticsSignHint',
    numhl  = 'LspDiagnosticsSignHint'
  }
)

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

---on_attach function for lspconfig
---@param _ any
---@param bufnr any
local custom_attach = function(_, bufnr)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = {noremap = true, silent = true}

  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  buf_set_keymap('n', '<leader>co', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
  buf_set_keymap('n', '<leader>ci', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)

  require('lsp_signature').on_attach{
    hi_parameter = 'QuickFixLine',
    handler_opts = {
      border = vim.g.floating_window_border,
    },
  }
end

local sumneko_root_path = vim.fn.expand('$HOME/github/lua-language-server')
local sumneko_binary = sumneko_root_path..'/bin/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_binary},
  on_attach = custom_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        enable = true,
        globals = {'vim', 'use'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        maxPreload = 10000,
        preloadFileSize = 10000,
      },
      telemetry = {enable = false},
    },
  },
}

nvim_lsp.gopls.setup {
  on_attach = custom_attach,
  capabilities = capabilities,
  filetypes = {'go', 'gomod'},
  cmd = {'gopls', '-remote.debug=:0'},
  settings = {
    gopls = {
      staticcheck = true,
    },
  },
}

nvim_lsp.pylsp.setup {
  on_attach = custom_attach,
  capabilities = capabilities,
}

nvim_lsp.solargraph.setup {
  on_attach = custom_attach,
  capabilities = capabilities,
}

