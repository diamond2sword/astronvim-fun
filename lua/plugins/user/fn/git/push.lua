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

local git_push = function(commit_name)
  local git_bash_path = get_git_bash_path()
  if git_bash_path == nil then return end
  local cmd = 'bash '..git_bash_path..' push '..commit_name
  toggleterm_cmd(cmd)
end

return function()
  vim.ui.input({
    prompt = ' Git Push: Commit name',
    default = 'Update project'
  }, function(commit_name)
    if commit_name == nil then return end
    git_push(commit_name)
  end)
end
