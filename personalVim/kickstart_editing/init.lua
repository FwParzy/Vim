-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


require 'lazy'
require 'options'
require 'keymaps'
require 'plugins.lsp.lsp'
require 'plugins.lsp.cmp'
require 'plugins.telescope.telescope'
require 'plugins.telescope.fzf'
require 'plugins.treesitter'
require 'plugins.autoformat'

require 'plugins.toggleterm'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
