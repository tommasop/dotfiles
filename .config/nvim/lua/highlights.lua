-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

M.ui = {
  changed_themes = {
    chadracula = {
      base_16 = {
        base00 = "282936",
        base01 = "3a3c4e",
        base02 = "4d4f68",
        base03 = "626483",
        base04 = "62d6e8",
        base05 = "e9e9f4",
        base06 = "f1f2f8",
        base07 = "f7f7fb",
        base08 = "ea51b2",
        base09 = "b45bcf",
        base0A = "00f769",
        base0B = "ebff87",
        base0C = "a1efe4",
        base0D = "62d6e8",
        base0E = "b45bcf",
        base0F = "00f769",
      },
    },
  },
}

return M
