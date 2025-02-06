
return function()
  local shada_dir = vim.fn.stdpath("state").."/shada"
  local cmd = 'rm -rf '..shada_dir.."/*"
  require("plugins.user.fn.toggleterm.cmd")(cmd)
end
