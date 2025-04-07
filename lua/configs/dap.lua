local dap = require("dap")

local map = vim.keymap.set

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dc", "<cmd> DapContinue <CR>", { desc = "Start or continue DAP" })
map("n", "<leader>do", "<cmd> DapStepOver <CR>", { desc = "Step over" })
map("n", "<leader>dO", "<cmd> DapStepOut <CR>", { desc = "Step out" })
map("n", "<leader>di", "<cmd> DapStepInto <CR>", { desc = "Step into" })
map("n", "<leader>dq", "<cmd> DapTerminate <CR>", { desc = "Terminate" })
map("n", "<leader>dr", function()
  dap.restart()
end, { desc = "Restart" })

vim.fn.sign_define("DapBreakpoint", {
  text = "",
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "", -- or "❌"
  texthl = "DiagnosticSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapStopped", {
  text = "", -- or "→"
  texthl = "DiagnosticSignWarn",
  linehl = "Visual",
  numhl = "DiagnosticSignWarn",
})
