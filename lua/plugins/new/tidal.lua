return {
	"dominikocsofszki/tidal.nvim",
	opts = {
		-- Your configuration here
		mappings = {
			send_node = { mode = "n", key = "<leader>r" },
			send_line = { mode = { "i", "n" }, key = "<S-CR>" },
			send_visual = { mode = { "x" }, key = "<S-CR>" },
			send_block = { mode = { "i", "n", "x" }, key = "<M-CR>" },
			-- send_node = { mode = "n", key = "<leader><CR>" },
			send_silence = { mode = "n", key = "<leader>d" },
			send_hush = { mode = "n", key = "<c-s>" },
		}, -- See configuration section for defaults
	},
	-- Recommended: Install TreeSitter parsers for Haskell and SuperCollider
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "haskell", "supercollider" } },
	},
}
