vim.api.nvim_set_keymap('n', "-", ":NvimTreeToggle<CR>", { noremap = true, silent = true})

vim.api.nvim_set_keymap('n', "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
