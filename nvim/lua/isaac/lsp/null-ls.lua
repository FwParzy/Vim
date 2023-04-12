local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- these are the installed formatters and diagnostics
local required_executables = {
	"prettier",
  "jdtls",
	"black",
	"stylua",
	"google-java-format",
	"eslint",
	"semgrep",
	"sqlfluff",
	"flake8",
}

local function file_exists(path)
	local f = io.open(path, "r")
	if f then
		f:close()
		return true
	end
	return false
end

null_ls.setup({
	debug = false,
	sources = {
		-- prettier is js, jsx, ts
		formatting.prettier.with({ extra_args = { "--single-quote", "--jsx-single-quote" } }),
		-- black is python
		formatting.black.with({
			extra_args = { "--line-length=120", "--skip-string-normalization" },
		}),
		formatting.stylua,
		formatting.google_java_format,
		diagnostics.eslint,
		diagnostics.semgrep.with({
			extra_args = { "--config", "auto" },
			condition = function()
        local bufname = vim.api.nvim_buf_get_name(0)
				return file_exists(bufname)
			end,
		}),
		diagnostics.sqlfluff,
		diagnostics.flake8.with({
			extra_args = { "--max-line-length=100" },
		}),
	},
})
