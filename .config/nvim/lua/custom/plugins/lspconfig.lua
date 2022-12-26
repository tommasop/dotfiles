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
      -- I choose to disable dialyzer for personal reasons, but
      -- I would suggest you also disable it unless you are well
      -- aquainted with dialzyer and know how to use it.
      dialyzerEnabled = true,
      -- I also choose to turn off the auto dep fetching feature.
      -- It often get's into a weird state that requires deleting
      -- the .elixir_ls directory and restarting your editor.
      fetchDeps = true
    }
  }
}
