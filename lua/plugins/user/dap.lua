return {
    "mfussenegger/nvim-dap",
    config = function()
        require('plugins.user.dap.init-listeners')
        require('plugins.user.pack.c.dap')
    end,
}
