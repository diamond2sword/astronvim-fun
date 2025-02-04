
return {
    "mfussenegger/nvim-dap",
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        require('plugins.dap.c')
        dap.configurations.cpp = dap.configurations.c
        dap.configurations.rust = dap.configurations.c
        dap.listeners.before.attach.dapui_config = dapui.open
        dap.listeners.before.launch.dapui_config = dapui.open
        dap.listeners.before.event_terminated.dapui_config = dapui.close
        dap.listeners.before.event_exited.dapui_config = dapui.close
    end,
}
