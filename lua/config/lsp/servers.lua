-- vim: ts=2 sw=2 et

local nvim_lsp = require('lspconfig')

---Enable lsp_document_highlight
---@param client any
local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

---on_attach function for lspconfig
---@param client any
---@param bufnr any
local custom_attach = function(client, bufnr)
  print('Attaching to: ' .. client.name)

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local opts = {noremap = true, silent = true}

  buf_set_keymap('n', 'g0', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', opts)
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  buf_set_keymap('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)


  buf_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)

  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

  buf_set_keymap('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)

  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)

  -- buf_set_keymap('n', '<leader>co', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
  -- buf_set_keymap('n', '<leader>ci', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)

  lsp_highlight_document(client)

  if client.resolved_capabilities.code_lens then
    vim.cmd[[autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]]
    vim.lsp.codelens.refresh()
  end

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
      completion = {
        callSnippet = 'Replace',
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
  cmd = {'gopls', '-remote.debug=:0'},
  filetypes = {'go', 'gomod'},
  on_attach = custom_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      staticcheck = true,
    },
  },
  max_line_len = 120,
  tag_transform = false,
  test_dir = '',
  lsp_cfg = true,
  lsp_gofumpt = true,
  lsp_on_attach = true,
  dap_debug = true,
}

nvim_lsp.pylsp.setup {
  on_attach = custom_attach,
  capabilities = capabilities,
}

nvim_lsp.solargraph.setup {
  on_attach = custom_attach,
  capabilities = capabilities,
}

nvim_lsp.cmake.setup {
  cmd = {'cmake-language-server'},
  filetypes = {'cmake'},
  capabilities = capabilities,
  on_attach = custom_attach,
  init_options = {buildDerectory = 'build'},
}

