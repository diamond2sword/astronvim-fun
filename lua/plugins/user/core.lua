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
          desc = " Git Push"
        },
        ['<Leader>S<C-d>'] = {
          require('plugins.user.fn.session.rm-shada'),
          desc = "󰛌 Delete All Shada Files"
        },
        ['<Leader>bS'] = {
          desc = " Buffer's Swap File",
        },
        ['<Leader>bSd'] = {
          require('plugins.user.fn.buf.rm'),
          desc = " Delete Buffer's Swap File"
        },
      },
      v = {
        ["<C-c>"] = {
          require('plugins.user.fn.termux.copy'),
          desc = " Copy",
        },
      },
    },
  }
}

