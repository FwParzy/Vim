local status_ok, neodev = pcall(require, "neodev")
if not status_ok then
  return
end

neodev.setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
  ...
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end


--TODO DAP
