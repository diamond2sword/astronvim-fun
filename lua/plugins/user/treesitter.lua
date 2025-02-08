return {
  "nvim-treesitter/nvim-treesitter",
  lazy = "true",
  opts = {
    ensure_installed = {
      -- neovim
      "vim",
      "lua",
      -- my langauges
      "bash",
      "c",
      "cpp",
      "python",
    },
  },
  auto_install = false,
}
