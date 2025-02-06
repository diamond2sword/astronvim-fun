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
            vim.fn.jobstart('rm -rf '..shada_dir.."/*", {
              on_exit = function()
                vim.notify('Deleted Shada All Files')
              end,
            })
          end,
          desc = "Delete All Shada Files"
        },
        ['<Leader>sd'] = {
          function()
            local swp_file = vim.fn.swapname()
            if swp_file ~= "" and vim.fn.filereadable(swp_file) then
              vim.fn.delete(swp_file)
            end
          end,
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

