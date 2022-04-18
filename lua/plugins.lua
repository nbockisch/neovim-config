-- Include plugins to be installed here
local PKGS = {
  -- Have Paq manage itself
  'savq/paq-nvim';

  -- Boilerplate plugins
  'nvim-lua/plenary.nvim'; -- contains functions used by other plugins

  -- Navigation
  'nvim-telescope/telescope.nvim';
  {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'};

  -- LSP and autocompletion
  'williamboman/nvim-lsp-installer';
  'neovim/nvim-lspconfig';
  'hrsh7th/nvim-cmp';

  -- Snippets
  'L3MON4D3/LuaSnip';
  'rafamadriz/friendly-snippets';

  -- nvim-cmp sources
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-cmdline';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-nvim-lua';
  'hrsh7th/cmp-path';
  'saadparwaiz1/cmp_luasnip';

  -- Misc lsp/cmp related plugins
  'onsails/lspkind.nvim';

  -- Highlighting
  {'nvim-treesitter/nvim-treesitter', run = TSUpdate};

  -- Terminal
  'akinsho/toggleterm.nvim';

  -- Bar
  'kyazdani42/nvim-web-devicons';
  'nvim-lualine/lualine.nvim';

  -- Quality of life
  'jiangmiao/auto-pairs';
  'tpope/vim-commentary';
  'tpope/vim-surround';

  -- Colorschemes
  'sainnhe/everforest';
}

-- Make sure paq is on system
local function clone_paq()
  local path = vim.fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system {
      'git',
      'clone',
      '--depth=1',
      'https://github.com/savq/paq-nvim.git',
      path
    }
  end
end

-- Bootstrap Paq and plugins
local function bootstrap_paq()
  -- Make sure paq is on system
  clone_paq()

  -- Load Paq
  vim.cmd('packadd paq-nvim')
  local paq = require('paq')

  -- Read and install packages
  paq(PKGS)
  paq.install()
end

bootstrap_paq()

-- Include plugin configs here
require('plugin-confs.telescope')
require('plugin-confs.nvim-lspconfig')
require('plugin-confs.nvim-lsp-installer')
require('plugin-confs.nvim-cmp')
require('plugin-confs.luasnip')
require('plugin-confs.nvim-treesitter')
require('plugin-confs.toggleterm')
require('plugin-confs.lualine')
