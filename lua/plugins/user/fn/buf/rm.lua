return function()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local swp_file = vim.fn.swapname(buf_name)
  local cmd = 'rm -rf '..swp_file
  require("plugins.user.fn.toggleterm.cmd")(cmd)
end
