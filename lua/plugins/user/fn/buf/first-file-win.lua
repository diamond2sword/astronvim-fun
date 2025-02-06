local buf_to_win = require('plugins.user.fn.buf.buf-to-win')
local first_file_buf = require('plugins.user.fn.buf.first-file-buf')

return function()
  local buf = first_file_buf()
  if buf == nil then return end
  return buf_to_win(buf)
end
