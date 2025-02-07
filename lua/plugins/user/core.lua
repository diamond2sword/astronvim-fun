return {
  "AstroNvim/astrocore",
  lazy = true,
  opts = {
    options = {
      opt = { -- vim.opt.<key>
        wrap = true, -- sets vim.opt.wrap
        clipboard = "", -- don't integrate termux-clipboard
        swapfile = false,
        -- optimizations
        lazyredraw = true,
        backup = false, -- no files
        writebackup = false,
        undofile = true, -- persistent history
        synmaxcol = 200,
        autoread = true,
        updatetime = 200, -- disagnostics
        timeoutlen = 250, -- keymaps
        ttimeoutlen = 0, -- instant key
        hidden = true, -- buffers
        redrawtime = 1000, -- timeout
        termguicolors = true, -- better colors
        laststatus = 2, -- simplify statusline
      }
    },
    mappings = require('plugins.user.mappings')
  }
}

