vim.g.neoformat_try_node_exe = 1

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.js", "*.ts", "*.jsx", "*.tsx"},
    callback = function()
        vim.cmd.Neoformat("prettierd")
    end
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = {"*.py"},
    callback = function ()
        vim.cmd.Neoformat("black")
    end
})
