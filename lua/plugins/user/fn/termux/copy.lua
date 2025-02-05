return function()
  vim.cmd('normal! "ay')
  local text = vim.fn.getreg('a')
  text = text:gsub("\n*$", "")
  text = text:gsub("^\n*", "")

  vim.notify(" Copying...", vim.log.levels.INFO)

  vim.fn.jobstart('cat << "EOF" | termux-clipboard-set\n'..text..'\nEOF', {
    on_exit = function()
      vim.notify(" Copied!", vim.log.levels.INFO)
    end,
  })
end
