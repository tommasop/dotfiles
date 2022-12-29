local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {'html', 'cssls', 'pyright', 'tsserver', 'solargraph', 'sorbet', 'gopls'}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig['elixirls'].setup {
  cmd = { "/home/tommasop/.local/share/nvim/mason/packages/elixir-ls/language_server.sh" },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    elixirLS = {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = true,
      suggestSpecs = false,
    }
  }
}
