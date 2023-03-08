local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use 'kyazdani42/nvim-web-devicons' -- Usefull Icon Pack used by other plugins

  -- Colorschemes
  use "ellisonleao/gruvbox.nvim"
  use "Mofiqul/dracula.nvim"

  -- Looks
  use "akinsho/bufferline.nvim" -- Shows Buffers in top
  use "moll/vim-bbye" -- Custom Buffer commands -- Bdelete
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }} -- lualine is a status line for the bottom.

  -- cmp plugins
  -- commit 0ad2450ff617a3568cc3f5e46f13635ef5185e6c 10/11/2022
  use {"hrsh7th/nvim-cmp", commit = "0ad2450ff617a3568cc3f5e46f13635ef5185e6c"} -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- completion inside nvim config
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to used
  use "SirVer/ultisnips"
  use "quangnguyen30192/cmp-nvim-ultisnips"
  use "cristianoliveira/vim-react-html-snippets"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
  use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons", } -- Better lsp diagnostics

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", }
  use "nvim-treesitter/nvim-treesitter-context"
  use "p00f/nvim-ts-rainbow" -- Rainbow brackets for nesting
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Text QOL changes
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "phaazon/hop.nvim" -- Adds highlighting for unique chars when pressing f or F

  -- Git
  use "lewis6991/gitsigns.nvim" -- The lil lefthand markers for git

  -- Nvim Tree
  use 'kyazdani42/nvim-tree.lua' -- Basically Nerdtree for nvim

  -- Terms inside nvim
  use "akinsho/toggleterm.nvim"
  use "ellisonleao/glow.nvim"

  -- Personal wiki page and note taking
  -- TODO FIX THIS SHIT
  use { 'vimwiki/vimwiki',
    config = function()
        vim.g.vimwiki_global_ext = 0
        vim.g.vimwiki_list = {
            {
                path = '~/vimwiki/',
                syntax = 'markdown',
                ext = '.md',
            }
        }
    end
}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
