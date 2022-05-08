local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
  return
end

-- Add servers here to be installed
local servers = {
  'ansiblels',
  'bashls',
  'clangd',
  'cssls',
  'gopls',
  'html',
  'pyright',
  'rust_analyzer',
  'sumneko_lua',
  'tsserver',
}

-- Bootstrap language servers
for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
    }
  }
})
--
-- Keybindings
local bind = vim.api.nvim_set_keymap -- save some typing
local buf_bind = vim.api.nvim_buf_set_keymap 
local opts = { noremap=true, silent=true }

-- bind('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
bind('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
bind('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- bind('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  buf_bind(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)

  buf_bind(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

  buf_bind(bufnr, 'n', '<A-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', 
    opts)

  buf_bind(bufnr, 'n', '<leader>wa', 
    '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)

  buf_bind(bufnr, 'n', '<leader>wr', 
    '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)

  buf_bind(bufnr, 'n', '<leader>wl', 
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 
    opts)

  buf_bind(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

  buf_bind(bufnr, 'n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  buf_bind(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)

  buf_bind(bufnr, 'n', '<leader>cra', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

  buf_bind(bufnr, 'n', 'gld', '<cmd>lua vim.diagnostic.open_float()<CR>', 
    {noremap = true}) -- Open a window with diagnostics

end

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = on_attach,
  }

  -- (optional) Customize the options passed to the server
  -- if server.name == "tsserver" then
  --     opts.root_dir = function() ... end
  -- end

  server:setup(opts)
end)
