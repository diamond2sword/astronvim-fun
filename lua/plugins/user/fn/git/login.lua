local git_cmd = require('plugins.user.fn.git.cmd')

return function()
  git_cmd('login')
end
