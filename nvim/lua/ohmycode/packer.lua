return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("sbdchd/neoformat")

    use("nvim-lua/plenary.nvim")
    use("nvim-lua/popup.nvim")
    use("nvim-telescope/telescope.nvim")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("tzachar/cmp-tabnine", { run = "./install.sh" })
    use("onsails/lspkind-nvim")
    use("glepnir/lspsaga.nvim")
    use("simrat39/symbols-outline.nvim")

    use("TimUntersberger/neogit")
    use({'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim'})

    use("mbbill/undotree")

    use("tpope/vim-commentary")
    use("windwp/nvim-autopairs")

    -- DAP
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    use({
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    })
    use({
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    })
    use({
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
    })
    -- Colorscheme section
    use("gruvbox-community/gruvbox")
end)
