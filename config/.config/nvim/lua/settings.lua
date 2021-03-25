vim.o.expandtab = true;
vim.o.shiftwidth = 4;
vim.o.softtabstop = 4;

-- Configure treesitter
require'nvim-treesitter.configs'.setup {
    -- Enable highlighting
    highlight = {
        enable = true,
    },
    -- Enable indentation
    indent = {
        enable = true,
    },
}

vim.cmd "colorscheme nord"
