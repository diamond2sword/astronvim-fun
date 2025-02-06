local toggleterm_cmd = require('plugins.user.fn.toggleterm.cmd')

return function()
  vim.cmd('normal! "ay')
  local text = vim.fn.getreg('a')
  text = text:gsub("\n*$", "")
  local cmd = 'cat << "EOF" | termux-clipboard-set\n'..text..'\nEOF'
  toggleterm_cmd(cmd)
end
