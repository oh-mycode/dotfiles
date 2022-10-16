return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("sbdchd/neoformat")

    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")
    
    use("neovim/nvim-lspconfig")

    -- Colorscheme section
    use("gruvbox-community/gruvbox")
end)
