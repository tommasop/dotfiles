-- example file i.e lua/custom/init.lua
-- load your options globals, autocmds here or anything .__.
-- you can even override default options here (core/options.lua)
local g = vim.g
g.mapleader = ","
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local elixir = augroup("elixir", { clear = true })
autocmd("BufWritePost", { group = elixir, pattern = "*.ex, *.exs", command = "silent :!mix format --check-equivalent %" })
