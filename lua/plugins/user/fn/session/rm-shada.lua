local toggleterm_cmd = require("plugins.user.fn.toggleterm.cmd")

return function()
  local shada_dir = vim.fn.stdpath("state").."/shada"
  local cmd = 'rm -rf '..shada_dir.."/*"
  toggleterm_cmd(cmd)
end
