local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_masonlsp_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_masonlsp_ok then
	return
end

require("mason").setup()
require("mason-lspconfig").setup()
-- require('mason-lspconfig').setup_handlers({
--   function(server)
--     lspconfig[server].setup({})
--   end,
--   ['sumneko_lua'] = function()
--     lspconfig.sumneko_lua.setup({
--       settings = {
--         Lua = {
--           diagnostics = {
--             globals = { "vim", "require" },
--           },
--           workspace = {
--             library = {
--               [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--               [vim.fn.stdpath("config") .. "/lua"] = true,
--             },
--           },
--         },
--       },
--     })
--   end
-- })
