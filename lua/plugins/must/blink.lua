return {
	'saghen/blink.cmp',
	dependencies = { 'rafamadriz/friendly-snippets' },
	version = '1.*',
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = 'default' },
		appearance = {
			nerd_font_variant = 'normal'
		},


		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },

		completion = {
			ghost_text = {
				enabled = true,
				show_with_menu = false,
			},

			documentation = { auto_show = true },
			menu = {
				auto_show = false,
				draw = {
					treesitter = { 'lsp' },
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
					cursorline_priority = 0

				}
			}
		}

	},
	opts_extend = { "sources.default" }
}
