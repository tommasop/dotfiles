require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "<Esc>", "<C-\\><C-n>", { desc = "Escape vim mode from insert" })
map("t", "jk", "<C-\\><C-n>", { desc = "Escape vim mode in terminal" })
map("n", "|", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Live grep" })
map("n", ";", "<cmd>Telescope buffers<CR>", { desc = "Telescope Find buffers" })
map("n", "<Space><Space>", "<C-^>", { desc = "Previous buffer" })
map("n", "<leader>t", "<cmd>TestNearest<CR>", { desc = "Test nearest" })
map("n", "<leader>T", "<cmd>TestFile<CR>", { desc = "Test file" })
map("n", "<leader>A", "<cmd>TestSuite<CR>", { desc = "Test suite" })
map("n", "<leader>g", "<cmd>LazyGit<CR>", { desc = "LazyGit open" })
map("n", "<Space>e", function()
  local float = vim.diagnostic.config().float

  if float then
    local config = type(float) == "table" and float or {}
    config.scope = "line"

    vim.diagnostic.open_float(config)
  end
end, { desc = "Wrap error long line" })
