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

Table = {}

local function override_with(table, opts)
  for k, v in pairs(opts) do
    table[k] = v
  end
end

local notify_exit_code = function(msg_cmd, msg_ok, msg_err)
  return function(exit_code)
    if exit_code == 0 then
      vim.notify(msg_cmd..'\n'..(msg_ok or 'SUCCESS'), vim.log.levels.INFO)
    else
      vim.notify(msg_cmd..'\n'..(msg_err or 'ERROR'), vim.log.levels.ERROR)
    end
  end
end

local toggleterm_cmd = require('plugins.user.fn.toggleterm.cmd')
toggleterm_cmd = function(cmd, opts)
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
  override_with(default_opts, opts)
  local term = Terminal:new(default_opts)
  term:toggle()
end


local git_push = function(commit_name)
  local git_bash_path = get_git_bash_path()
  if git_bash_path == nil then return end
  vim.notify(' Git Push: Pushing...', vim.log.levels.INFO)

  local cmd = 'bash '..git_bash_path..' push '..commit_name
  toggleterm_cmd(cmd, {
    -- on_exit = function(_, _, exit_code)
    --   notify_exit_code(' Git Push', 'Pushed!', 'Unable to push')(exit_code)
    -- end,
  })
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
