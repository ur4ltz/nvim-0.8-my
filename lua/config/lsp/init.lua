-- vim: ts=2 sw=2 et

local nvim_lsp = require('lspconfig')

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local custom_attach = function(_, bufnr)
  local opts = {noremap = true, silent = true}

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>co', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ci', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
end

local sumneko_root_path = vim.fn.expand('$HOME/github/lua-language-server')
local sumneko_binary = sumneko_root_path..'/bin/Linux/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, sumneko_root_path .. '/main.lua'},
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

