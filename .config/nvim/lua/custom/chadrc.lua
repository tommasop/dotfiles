-- Just an example, supposed to be placed in /lua/custom/

local M = {}

M.ui = {
  theme = "chadracula",
}

M.mappings = require "custom.mappings"

M.plugins = {
  user = require "custom.plugins",
}

return M
