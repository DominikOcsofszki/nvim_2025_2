return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
	},
	{ "folke/which-key.nvim" },
	{ "tpope/vim-fugitive" },
}
