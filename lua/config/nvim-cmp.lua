-- vim: ts=2 sw=2 et:

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp        = require('cmp')
local cmp_buffer = require('cmp_buffer')
local lspkind    = require('lspkind')
local luasnip    = require('luasnip')

cmp.setup {
  snippet = {
    expand = function(args)
      -- vim.fn['vsnip#anonymous'](args.body)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
  sources = {
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip'},
    {
      name = 'buffer',
      option = {
        keyword_length = 3,             -- Default 3
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
        indexing_interval       = 100,  -- Default 100
        indexing_batch_size     = 1000, -- Default 1000
        max_indexed_line_lenght = 40960 -- Default (1024 * 40) (40 Kilobytes)
      },
    },
    {name = 'path'},
    {name = 'calc'},
    {name = 'cmp_git'},
  },
  sorting = {
    comparators = {
      function(...) return cmp_buffer:compare_locality(...) end,
    },
  },
  documentation = {
    border = 'rounded',
  },
  formatting = {
    format = lspkind.cmp_format({with_text = true, menu = ({
      nvim_lsp = '[Lsp]',
      nvim_lua = '[Lua]',
      luasnip  = '[Snippet]',
      buffer   = '[Buffer]',
      path     = '[Path]',
      calc     = '[Calc]',
      cmp_git  = '[Git]',
    })}),
  },
}

cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    {name = 'git'},
  }, {
    {name = 'buffer'},
  })
})

local search_source = {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {name = 'nvim_lsp_document_symbol'} -- trigger by "/@"
  }, {
    {name = 'buffer', keyword_length = 3}
  })
}

-- `/` cmdline setup.
cmp.setup.cmdline('/', search_source)
cmp.setup.cmdline('?', search_source)

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    {name = 'cmdline', group_index = 1},
  }, {
    {name = 'nvim_lua'},
    {name = 'cmdline_history', group_index = 2},
  }),
})

