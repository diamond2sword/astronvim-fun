local function table_override(table, opts)
  for k, v in pairs(opts or {}) do
    table[k] = v
  end
end

local notify_exit_code = function(msg_cmd, msg_ok, msg_err)
  return function(exit_code)
    if exit_code == 0 then
      vim.notify(msg_cmd..'\n\n'..(msg_ok or 'SUCCESS'), vim.log.levels.INFO)
    else
      vim.notify(msg_cmd..'\n\n'..(msg_err or 'ERROR'), vim.log.levels.ERROR)
    end
  end
end

local toggleterm_cmd = function(cmd, opts)
  local Terminal = require("toggleterm.terminal").Terminal
  local current_win = vim.api.nvim_get_current_win()
  local default_opts = {
    cmd = cmd,
    hidden = false,
    direction = "horizontal",
    on_create = function()
      vim.api.nvim_set_current_win(current_win)
      vim.api.nvim_input('<Esc>')
    end,
    auto_scroll = true,
    on_exit = function(_, _, exit_code)
      notify_exit_code(cmd)(exit_code)
    end,
  }
  table_override(default_opts, opts)
  local term = Terminal:new(default_opts)
  term:toggle()
  vim.notify(cmd..'\n\n'..'EXECUTING...')
end

return toggleterm_cmd
