-- Just an example, supposed to be placed in /lua/custom/

local M = {}
local override = require "custom.override"

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "chadracula",
}

M.mappings = require "custom.mappings"

M.plugins = {
  override = {
    ["williamboman/mason.nvim"] = override.mason,
  },
  user = require "custom.plugins",
}

return M
