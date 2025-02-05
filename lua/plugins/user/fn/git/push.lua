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

local toggleterm_cmd = function(cmd, override_opts)
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

local push = function(commit_name)
  local git_bash_path = get_git_bash_path()
  if git_bash_path == nil then return end

  local cmd = 'bash '..git_bash_path..' push '..commit_name
  vim.notify(' Git Push: Pushing...', vim.log.levels.INFO)

  toggleterm_cmd(cmd, {
    on_exit = function(_, _, exit_code)
      if exit_code == 0 then
        vim.notify(' Git Push: Pushed!', vim.log.levels.INFO)
      else
        vim.notify(' Git Push: Unable to push', vim.log.levels.ERROR)
      end
    end,
  })
end

return function()
  vim.ui.input({
    prompt = ' Git Push: Commit name',
    default = 'Update project'
  }, function(commit_name)
    if commit_name == nil then return end
    push(commit_name)
  end)
end
