local push = function(commit_name)
  local buf_path = vim.api.nvim_buf_get_name(0)
  local buf_dir = vim.fn.fnamemodify(buf_path, ":h")
  local repo_dir = vim.fn.systemlist("git -C "..buf_dir.." rev-parse --show-toplevel")[1]
  local git_bash_path = repo_dir.."/git.bash"
  if not vim.loop.fs_stat(git_bash_path) then
    vim.notify(" git.bash does not exist in repo", vim.log.levels.WARN)
    return
  end
  local current_win = vim.api.nvim_get_current_win()
  

  vim.notify(' Git Push: Pushing...', vim.log.levels.INFO)

  local cmd = 'bash '..git_bash_path..' push '..commit_name

  local Terminal = require("toggleterm.terminal").Terminal
  local term = Terminal:new({
    cmd = cmd,
    hidden = false,
    display_name = " Git Push: '"..commit_name.."'",
    direction = "horizontal",
    on_exit = function(_, _, exit_code)
      if exit_code == 0 then
        vim.notify(' Git Push: Pushed!', vim.log.levels.INFO)
      else
        vim.notify(' Git Push: Unable to push', vim.log.levels.ERROR)
      end
    end,
    on_create = function()
      vim.api.nvim_set_current_win(current_win)
      vim.api.nvim_input('<Esc>')
    end,
    auto_scroll = true,
  })
  term:toggle()
end

return function()
  vim.ui.input({
    prompt = ' Git Push: Commit name',
    default = 'Updated project'
  }, function(input)
    if input == nil then return end
    local commit_name = input
    push(commit_name)
  end)
end
