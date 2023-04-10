-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
local g = vim.g
g.mapleader = ","
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Use nvim-notify for errors and notifications
vim.notify = require("notify")

-- Elixir auto format on buffer save
local elixir = augroup("elixir", { clear = true })
autocmd("BufWritePost", { group = elixir, pattern = "*.ex, *.exs", command = "silent :!mix format --check-equivalent %" })
