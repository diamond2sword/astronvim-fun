return {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
        require('plugins.user.dap.init-listeners')
        require('plugins.user.pack.c.dap')
    end,
}
