
return function(cmd, override_opts)
  local Terminal = require("toggleterm.terminal").Terminal
  local current_win = vim.api.nvim_get_current_win()
  local term_opts = {
    cmd = cmd,
    hidden = false,
    direction = "horizontal",
    on_create = function()
      vim.api.nvim_set_current_win(current_win)
      vim.api.nvim_input('<Esc>')
    end,
    auto_scroll = true,
  }
  for _, p in ipairs(override_opts) do
    table.insert(term_opts, p)
  end
  local term = Terminal:new(term_opts)
  term:toggle()
end
