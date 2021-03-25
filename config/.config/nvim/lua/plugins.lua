-- Load packer.nvim
vim.cmd "packadd packer.nvim"

-- Initialize all plugins
return require("packer").startup(function(use) 
    use {'wbthomason/packer.nvim', opt = true}
    use 'arcticicestudio/nord-vim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    use 'itchyny/lightline.vim'
    use { 'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use 'jiangmiao/auto-pairs'
end)
