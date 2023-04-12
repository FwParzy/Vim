local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("isaac.lsp.mason")
require("isaac.lsp.lsp")
-- require("isaac.lsp.configs")
require("isaac.lsp.handlers").setup()
require("isaac.lsp.null-ls")

-- TODO make mason default and clean this shit up dawg
