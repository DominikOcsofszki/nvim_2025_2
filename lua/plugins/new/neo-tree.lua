local _nesting_rules = function()
	return {
		-- ~/.local/share/nvim/lazy/neo-tree.nvim/doc/neo-tree.txt:1391
		["docker"] = {
			pattern = "^dockerfile$",
			ignore_case = true,
			files = { ".dockerignore", "docker-compose.*", "dockerfile*" },
		}
	}
end
return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ "<leader>e",  ":Neotree toggle left<CR>",  desc = "NeoTree reveal", silent = false },
		{ "<c-e>",      ":Neotree toggle right<CR>", desc = "NeoTree reveal", silent = true },
		{ "<c-x><c-e>", ":Neotree toggle float<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		nesting_rules = _nesting_rules(),
		close_if_last_window = true,
		window = {
			mappings = {
				["P"] = {
					"toggle_preview",
					config = {
						use_float = false,
						use_image_nvim = true,
					}
				},
				["w"] = "open_with_window_picker",
				-- ["C"] = "close_node",
				-- ["C"] = "close_all_subnodes",
				["z"] = "close_all_subnodes",
				-- ["z"] = "close_all_nodes",
				["Z"] = "expand_all_subnodes",
				['Y'] = function(state)
					local result = vim.fn.fnamemodify(state.tree:get_node():get_id(), ':.')
					vim.fn.setreg('+', result)
					vim.notify('Copied: ' .. result)
				end,
				['gy'] = function(state)
					local result = vim.fn.fnamemodify(state.tree:get_node():get_id(), '')
					vim.fn.setreg('+', result)
					vim.notify('Copied: ' .. result)
				end,
				-- ['y'] = function(state)
				-- 	local result = state.tree:get_node():name()
				-- 	vim.fn.setreg('+', result)
				-- 	vim.notify('Copied: ' .. result)
				-- end
			}
		},
		use_popups_for_input = false,
		filesystem = {
			filtered_items = {
				hide_by_name = {
					".DS_Store",
					"thumbs.db",
					"node_modules",
					"tmp.lua",
					"tmp.py",
				},
				-- hide_by_pattern = { -- uses glob style patterns
				-- 	--"*.meta",
				-- 	--"*/src/*/tsconfig.json"
				-- },
				-- always_show = { -- remains visible even if other settings would normally hide it
				-- 	--".gitignored",
				-- },
				-- always_show_by_pattern = { -- uses glob style patterns
				-- 	--".env*",
				-- },
				-- never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
				-- 	--".DS_Store",
				-- 	--"thumbs.db"
				-- },
				-- never_show_by_pattern = { -- uses glob style patterns
				-- 	--".null-ls_*",
				-- },
			},
		},
	}
}
