-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rnw', vim.lsp.buf.rename, '[R]e[n]ame [W]ord')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.

local pid = vim.fn.getpid()
local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"

local servers = {
  -- clangd = {},
  -- gopls = {},
  pyright = {},
  tsserver = {},
  jdtls = {},
  omnisharp = {
    cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
    -- Add any other required settings for omnisharp here
  },
  -- csharp_ls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    local server_config = servers[server_name]
    local lspconfig_settings = {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = server_config,
    }

    -- OmniSharp Configuration
    if server_name == 'omnisharp' then
      lspconfig_settings.cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) }
      lspconfig_settings.on_attach = on_attach
    elseif server_name == 'jdtls' then
      lspconfig_settings.root_dir = function(fname)
        return util.root_pattern(".git", "pom.xml", ".classpath", "build.gradle", "settings.gradle")(fname) or
            util.path.dirname(fname)
      end
      local jdtls_install_path = "/home/linuxbrew/.linuxbrew/opt/jdtls"
      lspconfig_settings.cmd = { "bash", jdtls_install_path .. "/jdtls.sh", "-configuration",
        jdtls_install_path .. "/config_linux", "-data", "/home/parz/.cache/jdtls/workspace" }
    end

    require('lspconfig')[server_name].setup(lspconfig_settings)
  end,
}
require 'lspconfig'.jdtls.setup {
  cmd = { 'jdtls' },
  root_dir = function(fname)
    return require 'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
  end
}
