-- overriding default plugin configs!
local M = {}

M.mason = {
  ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      -- web dev
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "deno",
      "emmet-ls",
      "json-lsp",

      -- ruby 
      "sorbet",
      "solargraph",

      -- python
      "pyright",

      -- go
      "gopls",

      -- shell
      "shfmt",
      "shellcheck",
  },
}

return M
