local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,
     -- Ruby & Rails
   b.formatting.erb_lint,
   b.formatting.standardrb,

   -- Go
   b.formatting.gofmt,

   -- Elixir
   b.formatting.mix,
   b.formatting.surface,
   b.diagnostics.credo,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
