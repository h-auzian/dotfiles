-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path
	})
	vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Install plugins
return packer.startup(function(use)

	-- Packer.
	use "wbthomason/packer.nvim"

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
        tag = "0.1.1",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

    -- LSP
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},

            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-nvim-lua"},

            -- Snippets
            {"L3MON4D3/LuaSnip"},
            {"rafamadriz/friendly-snippet"},
        }
    }

    -- TreeSitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

	-- Auto-session
	use "rmagatti/auto-session"

    -- NvimTree
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {"nvim-tree/nvim-web-devicons"}
    }
    use "nvim-tree/nvim-web-devicons"

    -- Misc
    use {
        "cbochs/grapple.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }
    use {
        "akinsho/bufferline.nvim",
        requires = "nvim-tree/nvim-web-devicons"
    }
    use {
        "kevinhwang91/nvim-ufo",
        requires = "kevinhwang91/promise-async"
    }
    use "folke/flash.nvim"
    use "rmagatti/alternate-toggler"
    use "numToStr/Comment.nvim"
    use "xiyaowong/transparent.nvim"
    use "nvim-lualine/lualine.nvim"
    use "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
    use "alvan/vim-closetag"
    use "tpope/vim-surround"
    use "taybart/b64.nvim"
    use "folke/which-key.nvim"
    use "lewis6991/gitsigns.nvim"
    use "mrjones2014/smart-splits.nvim"
    use "norcalli/nvim-colorizer.lua"
    use "reisub0/hot-reload.vim"
    use "jiangmiao/auto-pairs"
    use "ggandor/leap.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "tikhomirov/vim-glsl"

	-- Themes
	use "ellisonleao/gruvbox.nvim"
	use "sainnhe/gruvbox-material"
    use "bluz71/vim-nightfly-guicolors"
    use "rebelot/kanagawa.nvim"
    use "marko-cerovac/material.nvim"
    use "tanvirtin/monokai.nvim"
    use "loctvl842/monokai-pro.nvim"
    use "ErichDonGubler/vim-sublime-monokai"
    use "sainnhe/everforest"

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end

end)
