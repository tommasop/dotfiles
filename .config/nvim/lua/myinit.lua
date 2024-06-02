-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd

-- Elixir auto format on buffer save
-- local elixir = augroup("elixir", { clear = true })
-- autocmd("BufWritePost", { group = elixir, pattern = "*.ex, *.exs", command = "silent :!mix format --check-equivalent %" })
local autocmd = vim.api.nvim_create_autocmd

autocmd("VimEnter", {
  command = ":silent !wezterm @ set-spacing padding=0 margin=0",
})

autocmd("VimLeavePre", {
  command = ":silent !wezterm @ set-spacing padding=20 margin=10",
})
