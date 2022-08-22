local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "isaac.lsp.configs"
-- require "isaac.lsp.lsp-installer"
require("isaac.lsp.handlers")
require "isaac.lsp.null-ls"
