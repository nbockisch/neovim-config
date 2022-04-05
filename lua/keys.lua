local bind = vim.api.nvim_set_keymap -- save some typing

-- Leader
vim.g.mapleader = ' '

-- Tab bindings
bind('n', '<Tab>', 'gt', {noremap = true})
bind('n', '<S-Tab>', 'gT', {noremap = true})
bind('n', '<A-t>', ':tabnew<CR>', {noremap = true})
bind('n', '<A-h>', ':tabmove -<CR>', {noremap = true})
bind('n', '<A-l>', ':tabmove +<CR>', {noremap = true})

-- Split resizing
bind('n', '<Up>', ':resize +2<CR>', {noremap = true})
bind('n', '<Down>', ':resize -2<CR>', {noremap = true})
bind('n', '<Left>', ':vertical resize +2<CR>', {noremap = true})
bind('n', '<Right>', ':vertical resize -2<CR>', {noremap = true})

-- Quality of life improvements
bind('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true}) -- move selected
bind('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true})
bind('n', 'gf', ':edit <cfile><CR>', {noremap = true}) -- Edit file under cursor

bind('v', '<', '<gv', {noremap = true}) -- reselect text after shifting it
bind('v', '>', '>gv', {noremap = true})

bind('v', '<leader>p', '"_dP', {noremap = true}) -- paste replace visual 
                                                 -- selection without copying it

bind('n', 'n', 'nzzzv', {noremap = true}) -- center searches on correct line
bind('n', 'N', 'Nzzzv', {noremap = true})

bind('i', ';;', '<Esc>A;<Esc>', {noremap = true}) -- easy ; or , insertion
bind('i', ',,', '<Esc>A,<Esc>', {noremap = true})

-- bind('n', '<leader>y',
--   ':execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>',
--   {noremap = true}) -- toggle 80 char column to make sure lines aren't too 
--   long

-- Allow deletion without copy
bind('v', '<leader>d', '"_d', {noremap = true})
bind('n', '<leader>dd', '"_dd', {noremap = true})
bind('n', '<leader>x', '"_x', {noremap = true})
bind('v', '<leader>x', '"_x', {noremap = true})
bind('n', '<leader>c', '"_c', {noremap = true})
bind('v', '<leader>c', '"_c', {noremap = true})
bind('n', '<leader>cc', '"_cc', {noremap = true})

-- File explorer
bind('n', '<leader>e', ':Lexplore | vert res 40<CR>', {noremap = true})

-- Plugin bindings can be found in the plugin configuration files
