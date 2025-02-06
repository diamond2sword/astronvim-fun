local get_git_bash_path = function()
  local buf_path = vim.api.nvim_buf_get_name(0)
  local buf_dir = vim.fn.fnamemodify(buf_path, ":h")
  local repo_dir = vim.fn.systemlist("git -C "..buf_dir.." rev-parse --show-toplevel")[1]
  local git_bash_path = repo_dir.."/git.bash"
  if not vim.loop.fs_stat(git_bash_path) then
    vim.notify(" git.bash does not exist in repo", vim.log.levels.WARN)
    return nil
  end
  return git_bash_path
end

local toggleterm_cmd = require('plugins.user.fn.toggleterm.cmd')

return function()
  local git_bash_path = get_git_bash_path()
  if git_bash_path == nil then return end
  local default_cmd = 'bash '..git_bash_path..' push \"\'Update project\'\"'
  vim.ui.input({
    prompt = ' Git Push: Confirm',
    default =  default_cmd
  }, function(cmd)
    if cmd == nil then return end
    toggleterm_cmd(cmd)
  end)
end
