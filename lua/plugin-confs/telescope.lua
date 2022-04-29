local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

-- Keybindings
local bind = vim.api.nvim_set_keymap -- save some typing

-- Basic navigation
bind('n', '<leader>ff', ':Telescope find_files<CR>', {noremap = true})
bind('n', '<leader>fg', ':Telescope live_grep<CR>', {noremap = true})
bind('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true})
bind('n', '<leader>fc', ':Telescope current_buffer_fuzzy_find<CR>', 
  {noremap = true})

-- Lsp navigation
bind('n', '<leader>lt', ':Telescope treesitter<CR>', {noremap = true})
bind('n', 'gr', 
  '<cmd>lua require(\'telescope.builtin\').lsp_references()<CR>', 
  {noremap = true})
-- bind('n', '<leader>ca', 
--   '<cmd>lua require(\'telescope.builtin\').lsp_code_actions()<CR>', 
--   {noremap = true})
-- bind('n', '<leader>cra', 
--   '<cmd>lua require(\'telescope.builtin\').lsp_range_code_actions()<CR>', 
--   {noremap = true})
bind('n', '<leader>gad', 
  '<cmd>lua require(\'telescope.builtin\').diagnostics()<CR>', {noremap = true})
  bind('n', '<leader>gi', 
'<  cmd>lua require(\'telescope.builtin\').lsp_implementations()<CR>', 
  {noremap = true})
bind('n', '<leader>gd', 
  '<cmd>lua require(\'telescope.builtin\').lsp_definitions()<CR>', 
  {noremap = true})
bind('n', '<leader>D', 
  '<cmd>lua require(\'telescope.builtin\').lsp_type_definitions()<CR>', 
  {noremap = true})

-- Git navigation
bind('n', '<leader>gf', ':Telescope git_files<CR>', {noremap = true})
bind('n', '<leader>gc', ':Telescope git_commits<CR>', {noremap = true})
bind('n', '<leader>gb', ':Telescope git_branches<CR>', {noremap = true})
bind('n', '<leader>gs', ':Telescope git_status<CR>', {noremap = true})
bind('n', '<leader>gx', ':Telescope git_stash<CR>', {noremap = true})

-- Custom functions
bind('n', '<leader>fnc', 
  '<cmd>lua require(\'telescope.builtin\').find_files({prompt_title = "Nvim Config", cwd = "~/.config/nvim/"})<CR>',
  {noremap = true})

-- More options
telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "^undodir/",
      "^scratch/",
    }
  }
}

-- Use native fzf for performance
telescope.load_extension('fzf')
