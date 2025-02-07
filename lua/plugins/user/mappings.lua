return {
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
    ["<Leader>g<C-l>"] = {
      require('plugins.user.fn.git.login'),
      desc = " Git Login"
    },
    ['<Leader>S<C-d>'] = {
      require('plugins.user.fn.session.rm-shada'),
      desc = "󰛌 Delete All Shada Files"
    },
    ['<Leader>bS'] = {
      desc = " Buffer's Swap File",
    },
    ['<Leader>bSd'] = {
      require('plugins.user.fn.buf.rm-swp'),
      desc = " Delete Buffer's Swap File"
    },
  },
  v = {
    ["<C-c>"] = {
      require('plugins.user.fn.termux.copy'),
      desc = " Copy",
    },
  },
}
