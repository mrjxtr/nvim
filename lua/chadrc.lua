-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ashes",
  -- theme = "material-darker",
  -- transparency = true,
  -- hl_override = {
  --     Comment = { italic = true },
  --     ["@comment"] = { italic = true },
  -- },
}

M.ui = {
  tabufline = {
    order = { "buffers", "tabs", "btns" },
    lazyload = false,
  },
}

M.term = {
  base46_colors = false,
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "                                                 ",
    "            ███       ███     ███████            ",
    "            ████     ████          ██            ",
    "            ███████████████████    ██            ",
    "            ███  ███  █████        ██            ",
    "            ███       █████        ██            ",
    "            ███       █████       ███            ",
    "            ███       █████   ██████             ",
    " ███████████████████████████████████████████████ ",
    "  ██                 ███████                 ██  ",
    "   █                 ██   ██                 █   ",
    "   █                 ██   ██                 █   ",
    "   █                 █     █                 █   ",
    "    █               █       █               █    ",
    "     ██           ██         ██           ██     ",
    "       ███████████             ███████████       ",
    "                                                 ",
    "     Powered By  NvChad     ",
    "                              ",
  },

  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

return M
