if true then return require("plugins.user.treesitter") end

if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- "lua",
      -- "c",
      -- "bash",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
