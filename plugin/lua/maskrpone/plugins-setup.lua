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

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	use("ayu-theme/ayu-vim") -- preferred colorscheme

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- essential plugins

	use("tpope/vim-surround")
	use("vim-scripts/ReplaceWithRegister")

	use("numToStr/Comment.nvim") --commenting with gc

	use("nvim-tree/nvim-tree.lua") -- file explorer

	use("kyazdani42/nvim-web-devicons") -- icons

	use("nvim-lualine/lualine.nvim") -- status line

	-- fuzzy finding w/ telescope
	use("BurntSushi/ripgrep")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder

	-- auto completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	use("williamboman/mason.nvim") -- managing & installing lsp servers
	use("williamboman/mason-lspconfig.nvim")

	use("neovim/nvim-lspconfig") -- configuring lsp servers

	use("hrsh7th/cmp-nvim-lsp")
	use({ "glepnir/lspsaga.nvim", branch = "main" })
	use("jose-elias-alvarez/typescript.nvim")
	use("onsails/lspkind.nvim")

	-- Transparency
	use("xiyaowong/nvim-transparent")

	-- Formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Cmake
	-- use("mfussenegger/nvim-dap")
	-- use("Civitasv/cmake-tools.nvim")

	use("Shatur/neovim-cmake")

	-- terminal
	use("voldikss/vim-floaterm")

	-- startify
	use("mhinz/vim-startify")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
