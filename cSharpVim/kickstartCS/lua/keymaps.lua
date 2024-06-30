local keymap = vim.keymap.set

-- Keymaps for better default experience
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true, desc = 'Remap space to nothing bc of leader' })

-- Inset mode Keymaps
keymap('i', 'jk', '<ESC>', { desc = 'Exit Insert Mode' })

-- Normal mode Keymaps
keymap('n', '<leader>wq', ':wqa<CR>', { desc = '[W]rite [Q]uit' })
keymap('n', '<leader>ww', ':w<CR>', { desc = '[W]rite' })
keymap('n', '<leader>qq', ':qa<CR>', { desc = '[Q]uit' })
keymap('n', '<leader>q1', ':qa!<CR>', { desc = '[Q]uit [1]!!!!' })
keymap('n', '<leader>F', ':Format<CR>', { desc = '[F]ormat' })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Deal with word wrap' })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Deal with word wrap' })

keymap('i', 'jk', '<ESC>', { desc = 'Exit Insert Mode' })

local opts = { noremap = true, silent = true }

keymap("n", "<leader>o", "o<ESC>0", opts)
keymap("n", "<leader>O", "O<ESC>0", opts)
keymap("n", "<leader>rn", ":set invrelativenumber<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader><S-d>", ":bdelete<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "<C-o>", "<ESC>o", opts)
keymap("i", ";", "v:lua.smart_semicolon()", { expr = true, noremap = true })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Select --
-- snippets
keymap('s', 'p', '<C-g>cp', opts)

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap('n', '<leader>i', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
