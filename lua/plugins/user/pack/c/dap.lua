local add_executable_adapter = require("plugins.user.dap.adapter.add-executable")
local config = {}
add_executable_adapter(config, 'lldb-dap')
add_executable_adapter(config, 'gdb', { '--interpreter=dap' })
require("dap").configurations.c = config
