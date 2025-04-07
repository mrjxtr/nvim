local dap = require("dap")
local dapui = require("dapui")

-- Configure DAP UI with layouts
dapui.setup({
  layouts = {
    {
      elements = {
        { id = "scopes", size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.25 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        { id = "console", size = 0.80 },
        { id = "repl", size = 0.20 },
      },
      size = 10,
      position = "bottom",
    },
  },
})

local map = vim.keymap.set
map(
  "n",
  "<leader>du",
  "<cmd>lua require('dapui').toggle()<CR>",
  { desc = "Toggle DAP UI" }
)

-- A wrapper function to avoid duplicate windows
local function open_dapui()
  pcall(dapui.close)
  vim.defer_fn(function()
    dapui.open()
    vim.cmd("wincmd p")
  end, 100)
end

-- DAP event listeners
dap.listeners.after.attach.dapui_config = function()
  open_dapui()
end
dap.listeners.after.launch.dapui_config = function()
  open_dapui()
end
-- dap.listeners.before.event_terminated.dapui_config = function()
-- dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
-- dapui.close()
-- end
