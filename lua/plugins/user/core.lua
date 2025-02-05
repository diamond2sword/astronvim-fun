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
        },
      },
      v = {
        ["<C-c>"] = {
          require('plugins.user.fn.termux.copy'),
          desc = " Copy",
        },
      },
    },
  }
}

