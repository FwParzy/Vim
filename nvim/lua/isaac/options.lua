local options = {
  backup = false, -- creates a backup file
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0, -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- the encoding written to a file
  hlsearch = true, -- highlight all matches on previous search pattern
  ignorecase = true, -- ignore case in search patterns
  mouse = "", -- allow the mouse to be used in neovim
  pumheight = 10, -- pop up menu height
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- always show tabs
  smartcase = true, -- smart case
  smartindent = true, -- make indenting smarter again
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  swapfile = false, -- creates a swapfile
  termguicolors = true, -- set term gui colors (most terminals support this)
  timeoutlen = 1000, -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true, -- enable persistent undo
  updatetime = 300, -- faster completion (4000ms default)
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  cursorline = true, -- highlight the current line
  number = true, -- set numbered lines
  relativenumber = false, -- set relative numbered lines
  numberwidth = 4, -- set number column width to 2 {default 4}
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  wrap = false, -- display lines as one long line
  scrolloff = 8, -- is one of my fav
  sidescrolloff = 8,
  guifont = "Hurmit NF:h17", -- the font used in graphical neovim applications
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
-- vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

-- Set cursorline to be off in insert moode
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local fn = vim.fn

local cursorGrp = augroup("CursorLine", { clear = true })
local bufcheck = augroup("bufcheck", {clear = true})

autocmd({ "InsertLeave", "WinEnter" }, { pattern = "*", command = "set cursorline", group = cursorGrp })
autocmd({ "InsertEnter", "WinLeave" }, { pattern = "*", command = "set nocursorline", group = cursorGrp })

-- windows to close with "q"
autocmd(
  "FileType",
  { pattern = { "help", "startuptime", "qf", "lspinfo", "nvim-tree" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)
autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- Restore last curson position upon reopen
autocmd('BufReadPost',  {
    group    = 'bufcheck',
    pattern  = '*',
    callback = function()
      if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
         fn.setpos('.', fn.getpos("'\""))
         vim.api.nvim_feedkeys('zz', 'n', true)
         end end })

-- Set vimwiki to markdown
autocmd({ 'FileType', 'BufNewFile' }, {
  group = 'bufcheck',
  pattern = 'vimwiki',
  command = 'set filetype=markdown',
})

-- Strip trailing whitespaces on save

-- StripTrailingWhitespace()
   -- Only strip if the b:noStripeWhitespace variable isn't set
--  if exists('noStripWhitespace') then
--      return
--else
--autocmd(
--  "BufWritePre",
--  { pattern = "*", command = "%s/\\s\\+$//e" }
--)
--end

-- autocmd('BufWritePre', { pattern = "*", callback = StripTrailingWhitespace()})
-- autocmd('FileType', { pattern = 'markdown', command = 'let noStripWhitespace=1000'})

