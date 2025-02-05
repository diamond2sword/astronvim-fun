return {
  "AstroNvim/astrocore",
  opts = {
    options = {
      opt = { -- vim.opt.<key>
        wrap = true, -- sets vim.opt.wrap
        clipboard = "", -- don't integrate termux-clipboard
      }
    },
    mappings = {
      -- first key is the mode
      n = {
        gd = {
          function() vim.lsp.buf.definition() end,
          desc = "󰍉 Go to definition",
        },
        ["<Leader>g<C-s>"] = {
          function()
            local buf_path = vim.api.nvim_buf_get_name(0)
            local buf_dir = vim.fn.fnamemodify(buf_path, ":h")
            local repo_dir = vim.fn.systemlist("git -C "..buf_dir.." rev-parse --show-toplevel")[1]
            local git_bash_path = repo_dir.."/git.bash"
            if not vim.loop.fs_stat(git_bash_path) then
              vim.notify(" git.bash does not exist in repo", vim.log.levels.WARN)
              return
            end

            vim.notify(' Git Push: Pushing...: '..git_bash_path, vim.log.levels.INFO)
            vim.fn.jobstart('bash '..git_bash_path..' push', {
              on_exit = function()
                vim.notify(" Git Push: Pushed!", vim.log.levels.INFO)
              end,
            })
          end,
          desc = " Git Push"
        }
      },
      v = {
        ["<C-c>"] = {
          function()
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
          end,
          desc = " Copy",
        },
      },
    },
  }
}

