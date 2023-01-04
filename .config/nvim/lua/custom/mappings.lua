local M = {}
M.tommasop = {
  n = {
    -- find
    ["|"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    [";"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
    ["<Space><Space>"] = { "<C-^>", "previous buffer" },
    ["<leader>t"] = { "<cmd> TestNearest <CR>", "test nearest"},
    ["<leader>T"] = { "<cmd> TestFile <CR>", "test file"},
    ["<leader>A"] = { "<cmd> TestSuite <CR>", "test suite"},
  }
}

return M
