local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

-- Check nvim-lsp-installer config for keybindings

-- Disable in-line virtual text errors
vim.diagnostic.config({virtual_text = false})

-- Set icons for warning messages
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
