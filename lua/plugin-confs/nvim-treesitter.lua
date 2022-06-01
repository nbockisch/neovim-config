local status_ok, treesitter_configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

-- Main setup
treesitter_configs.setup {
  -- Add languages here
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'css',
    'go',
    'html',
    'jsonc',
    'lua',
    'python',
    'rust',
    'typescript',
    'yaml',
  },

  sync_install = false,

  highlight = {
    enable = true,
  },

  indent = {
    enable = true,
  },
}
