local status_ok, cmp = pcall(require, 'cmp')
if not status_ok then
  return
end

local status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then return
end

local status_ok, lspkind = pcall(require, 'lspkind')
if not status_ok then
  return
end

-- Get nice icons in completion menu
lspkind.init()

cmp.setup {
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-y>'] = cmp.mapping(
      cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { 'i', 'c' }
    ),
    ['<C-space>'] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(
        _ --[[fallback]]
        )
        if cmp.visible() then
          if not cmp.confirm { select = true } then
            return
          end
        else
          cmp.complete()
        end
      end,
    },
  },

  sources = {
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'cmdline' },
    { name = 'buffer', keyword_length = 5 },
  },

  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = '[buf]',
        nvim_lsp = '[LSP]',
        nvim_lua = '[lua]',
        path = '[path]',
        luasnip = '[snip]',
        cmdline = '[cmd]',
      },
    },
  },

  experimental = {
    native_menu = false,
    ghost_text = true,
  },
}
