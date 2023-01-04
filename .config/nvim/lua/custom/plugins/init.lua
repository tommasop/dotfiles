return {
  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["williamboman/mason.nvim"] = {
    override_options = {
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

          --elixir
          "elixir-ls",

          -- shell
          "shfmt",
          "shellcheck",
      },
    }
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["tpope/vim-abolish"] = {},
  ["elixir-editors/vim-elixir"] = {},
  ["mhanberg/elixir.nvim"] = {
    requires = { "nvim-lua/plenary.nvim" }
  },
  ["iamcco/markdown-preview.nvim"] = {
    run = function() vim.fn["mkdp#util#install"]() end
  },
  ["kdheepak/lazygit.nvim"] = {},
  ["rcarriga/nvim-notify"] = {},
  ["vim-test/vim-test"] = {},
}
