-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local highlight_group = vim.api.nvim_create_augroup('RemoveCarriageReturn', { clear = true })
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function()
    vim.cmd('%s/\\r//ge')
  end,
  group = highlight_group,
  pattern = '*',
})

_G.smart_semicolon = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  local line_content = vim.api.nvim_get_current_line()
  local next_char = string.sub(line_content, col + 1, col + 1)

  if next_char == ';' then
    return '<Right>'
  else
    return ';'
  end
end
