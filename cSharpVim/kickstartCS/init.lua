-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
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

require('lazy').setup({
  checker = { enabled = true },
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  -- {
  --   -- Autocompletion
  --   'hrsh7th/nvim-cmp',
  --   dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',
  --     'rafamadriz/friendly-snippets', 'cristianoliveira/vim-react-html-snippets' },
  -- },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-cmdline', 'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path', 'saadparwaiz1/cmp_luasnip', 'honza/vim-snippets' },
  },
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },
  { 'SirVer/ultisnips' },
  { 'quangnguyen30192/cmp-nvim-ultisnips' },
  { 'cristianoliveira/vim-react-html-snippets' },


  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',                    opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
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
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',   opts = {} },
  { 'akinsho/toggleterm.nvim', version = "*" },

  -- Fuzzy Finder (files, lsp, etc)
  require 'plugins.telescope.telescope',

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  require 'plugins.telescope.fzf',

  -- Highlight, edit, and navigate code
  require 'plugins.treesitter',

  require 'plugins.autoformat',
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
}, {})

require 'options'
require 'autocmd'
require 'keymaps'
require 'plugins.lsp.lsp'
require 'plugins.lsp.cmp'
require 'plugins.toggleterm'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
