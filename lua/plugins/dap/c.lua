local ok, dap = pcall(require, 'dap')
if not ok then
    return
end

--
-- See
-- https://sourceware.org/gdb/current/onlinedocs/gdb.html/Interpreters.html
-- https://sourceware.org/gdb/current/onlinedocs/gdb.html/Debugger-Adapter-Protocol.html

local ask_file = function()
    local path = vim.fn.input({
        prompt = 'Path to executable: ',
        default = vim.fn.getcwd() .. '/',
        completion = 'file',
    })
    return (path and path ~= '') and path or dap.ABORT
end
-- This requires special handling of 'run_last', see
-- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355

local ask_args = function()
    local args_str = vim.fn.input({
        prompt = 'Arguments: ',
    })
    return vim.fn.split(args_str, ' +')
end

local add_executable_configurations = function(config, type)
    table.insert(config, {
        name = type .. ': Run executable',
        type = type,
        request = 'launch',
        program = ask_file,
    })
    table.insert(config, {
        name = type ..': Run executable with arguments',
        type = type,
        request = 'launch',
        program = ask_file,
        args = ask_args,
    })
    table.insert(config, {
        name = type .. ': Attach to process',
        type = type,
        request = 'attach',
        processId = require('dap.utils').pick_process,
    })
end

local add_executable_adapter = function(config, executable, args)
    if vim.fn.executable(executable) == 1 then
        dap.adapters[executable] = {
            id = executable,
            type = 'executable',
            command = executable,
            args = args or {},
        }
        add_executable_configurations(config, executable)
    end
end

dap.configurations.c = {}
add_executable_adapter(dap.configurations.c, 'lldb-dap')
add_executable_adapter(dap.configurations.c, 'gdb', { '--interpreter=dap' })
