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
          require('plugins.user.fn.git.push'),
          desc = " Git Push"
        }
      },
      v = {
        ["<C-c>"] = {
          require('plugins.user.fn.termux.copy'),
          -- function()
          --   vim.cmd('normal! "ay')
          --   local text = vim.fn.getreg('a')
          --   text = text:gsub("\n*$", "")
          --   text = text:gsub("^\n*", "")
          --
          --   vim.notify(" Copying...", vim.log.levels.INFO)
          --
          --   vim.fn.jobstart('cat << "EOF" | termux-clipboard-set\n'..text..'\nEOF', {
          --     on_exit = function()
          --       vim.notify(" Copied!", vim.log.levels.INFO)
          --     end,
          --   })
          -- end,
          desc = " Copy",
        },
      },
    },
  }
}

