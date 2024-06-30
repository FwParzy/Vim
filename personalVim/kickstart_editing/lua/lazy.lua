-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim',          config = true },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'j-hui/fidget.nvim',                opts = {} },
      { 'folke/neodev.nvim' },
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip' },
  },
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  'SirVer/ultisnips',
  'quangnguyen30192/cmp-nvim-ultisnips',
  'cristianoliveira/vim-react-html-snippets',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',    opts = {} },

  -- Adds git releated signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Theme inspired by Atom
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',   opts = {} },
  { 'akinsho/toggleterm.nvim', version = "*" },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
    build = ":TSUpdate",
  },

  'neovim/nvim-lspconfig',
  -- TODO convert the following
  require 'plugins.debug',
  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { "<leader>e", ":NvimTreeOpen<CR>", { silent = true } }
    },
    opts = { 'plugins.nvim-tree' }
  },

  { "windwp/nvim-autopairs",   opts = { 'plugins.autopairs' } },
  { 'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons', opts = {} },
}

local opts = {}
require("lazy").setup(plugins, opts)
