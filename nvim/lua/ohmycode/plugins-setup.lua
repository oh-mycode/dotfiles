-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "sbdchd/neoformat"

    -- Colorscheme section
    use "gruvbox-community/gruvbox"
    use "navarasu/onedark.nvim"
    use "tiagovla/tokyodark.nvim"
    use "EdenEast/nightfox.nvim"

    -- use "/usr/local/opt/fzf"
    -- use "junegunn/fzf.vim"

    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"

    -- treesitter configuration
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
    use "nvim-telescope/telescope.nvim"

    -- autocompletion
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"

    -- configuring lsp servers
    use "neovim/nvim-lspconfig"
    use "hrsh7th/cmp-nvim-lsp"
    use "glepnir/lspsaga.nvim"
    use "onsails/lspkind-nvim"
    use "simrat39/symbols-outline.nvim"
    use "SmiteshP/nvim-navic"

    -- managing & installing lsp servers, linters & formatters
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"

    -- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

    -- snippets
    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "rafamadriz/friendly-snippets"

    -- git integration
	use "lewis6991/gitsigns.nvim"
    use "TimUntersberger/neogit"
    use {"sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim"}

    -- DAP
    use "mfussenegger/nvim-dap"
    use "rcarriga/nvim-dap-ui"
    use "theHamsta/nvim-dap-virtual-text"

    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly" -- optional, updated every week. (see issue #1193)
    }
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    use {
        'akinsho/bufferline.nvim',
        tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }
    use "lukas-reineke/indent-blankline.nvim"

    use "windwp/nvim-spectre" -- brew install gnu-sed
    use "numToStr/Comment.nvim"
    use "windwp/nvim-autopairs"
    use "mbbill/undotree"
    use {
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
    }
    use "editorconfig/editorconfig-vim"

    if packer_bootstrap then
        require("packer").sync()
    end
end)
