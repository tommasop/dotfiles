require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", "|", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", ";", "<cmd>Telescope buffers<CR>", { desc = "Telescope Find buffers" })
map("n", "<Space><Space>", "<C-^>", { desc = "Previous buffer" })
map("n", "<leader>t", "<cmd>TestNearest<CR>", { desc = "Test nearest" })
map("n", "<leader>T", "<cmd>TestFile<CR>", { desc = "Test file" })
map("n", "<leader>A", "<cmd>TestSuite<CR>", { desc = "Test suite" })
map("n", "<leader>g", "<cmd>LazyGit<CR>", { desc = "LazyGit open" })
