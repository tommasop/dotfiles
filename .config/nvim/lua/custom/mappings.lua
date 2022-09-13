local M = {}
M.tommasop = {
  n = {
    -- find
    ["|"] = { "<cmd> Telescope live_grep <CR>", "   live grep" },
    [";"] = { "<cmd> Telescope buffers <CR>", "  find buffers" },
    ["<leader><leader>"] = { "V" , "select line" },
    ["<Space><Space>"] = { "<C-^>", "previous buffer" },
  }
}

return M
