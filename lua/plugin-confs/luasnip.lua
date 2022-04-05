local status_ok, luasnip = pcall(require, 'luasnip')
if not status_ok then
  return
end

local types = require('luasnip.util.types')

-- Add additional snippets
require('luasnip.loaders.from_vscode').lazy_load()

-- Functions for navigating snippets
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

_G.jump_in_snippet = function ()
  if luasnip.expand_or_jumpable() then
    return t('<Plug>luasnip-expand-or-jump')
  end
end

_G.jump_back_in_snippet = function ()
  if luasnip.jumpable(-1) then
    return t('<Plug>luasnip-jump-prev')
  end
end

_G.change_snippet_choice = function ()
  if luasnip.choice_active() then
    return t('<Plug>luasnip-next-choice')
  end
end

-- Keybindings
local bind = vim.api.nvim_set_keymap -- save some typing

bind('i', '<C-k>', 'v:lua.jump_in_snippet()', {expr = true, silent = true})
bind('s', '<C-k>', 'v:lua.jump_in_snippet()', {expr = true, silent = true})

bind('i', '<C-j>', 'v:lua.jump_back_in_snippet()', {expr = true, silent = true})
bind('s', '<C-j>', 'v:lua.jump_back_in_snippet()', {expr = true, silent = true})

bind('i', '<C-l>', 'v:lua.change_snippet_choice()', 
  {expr = true, silent = true})

bind('n', '<leader><leader>s', 
  ':source ~/.config/nvim/lua/plugin-confs/luasnip.lua<CR>', {noremap = true})

-- Additional options
luasnip.config.set_config {
  history = true, -- Remember to keep around last snippet to jump back into it

  update_events = 'TextChanged,TextChangedI',
  
  enable_autosnippets = true,

  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { '<-', 'Error' } },
      },
    },
  },
}
