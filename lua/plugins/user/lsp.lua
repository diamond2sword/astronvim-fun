local lsp_handler_cmd = function(server, cmd)
  return function()
    require("lspconfig")[server].setup({
      cmd = { cmd },
    })
  end
end

return {
  "AstroNvim/astrolsp",
  opts = {
    -- enable servers that you already have installed without mason
    servers = {
      "clangd",
      "lua_ls"
    },
    -- customize how language servers are attached
    handlers = {
      lua_ls = lsp_handler_cmd("lua_ls", "lua-language-server"),
      clangd = lsp_handler_cmd("clangd", "clangd"),
    },
  }
}
