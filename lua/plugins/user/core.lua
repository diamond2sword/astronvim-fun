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
        ['<Leader>ps'] = { desc = "Shada Files" },
        ['<Leader>psd'] = {
          function()
            local shada_dir = vim.fn.stdpath("state").."/shada"
            local cmd = 'rm -rf '..shada_dir.."/*"
            require("plugins.user.fn.toggleterm.cmd")(cmd)
          end,
          desc = "Delete All Shada Files"
        },
        ['<Leader>bS'] = {
          desc = "Buffer's Swap File",
        },
        ['<Leader>bSd'] = {
          -- function()
          --   local buf_name = vim.api.nvim_buf_get_name(0)
          --   local swp_file = vim.fn.swapname(buf_name)
          --   local cmd = 'rm -rf '..swp_file
          --   require("plugins.user.fn.toggleterm.cmd")(cmd)
          -- end,
          require('plugins.user.fn.buf.rm'),
          desc = "Delete Buffer's Swap File"
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

