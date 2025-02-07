return {
  "nvim-treesitter/nvim-treesitter",
  lazy = "true",
  opts = {
    ensure_installed = {
      "vim",
      "bash",
      "lua",
      "c",
      "cpp",
    },
  },
  auto_install = false
}
