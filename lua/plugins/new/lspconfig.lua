local lsp_mappings = function(event)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition,
		{ buffer = event.buf, desc = "LSP: [G]oto [D]efinition" })

	vim.keymap.set("n", "grn", vim.lsp.buf.rename,
		{ buffer = event.buf, desc = "LSP: [R]e[n]ame" })

	vim.keymap.set({ "n", "x" }, "gra", vim.lsp.buf.code_action,
		{ buffer = event.buf, desc = "LSP: [G]oto Code [A]ction" })

	vim.keymap.set("n", "grr", require("telescope.builtin").lsp_references,
		{ buffer = event.buf, desc = "LSP: [G]oto [R]eferences" })

	vim.keymap.set("n", "gri", require("telescope.builtin").lsp_implementations,
		{ buffer = event.buf, desc = "LSP: [G]oto [I]mplementation" })

	vim.keymap.set("n", "grd", require("telescope.builtin").lsp_definitions,
		{ buffer = event.buf, desc = "LSP: [G]oto [D]efinition" })

	vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "LSP: [G]oto [D]eclaration" })

	vim.keymap.set("n", "gO", require("telescope.builtin").lsp_document_symbols,
		{ buffer = event.buf, desc = "LSP: Open Document Symbols" })

	vim.keymap.set("n", "gW", require("telescope.builtin").lsp_dynamic_workspace_symbols,
		{ buffer = event.buf, desc = "LSP: Open Workspace Symbols" })

	vim.keymap.set("n", "grt", require("telescope.builtin").lsp_type_definitions,
		{ buffer = event.buf, desc = "LSP: [G]oto [T]ype Definition" })
	vim.keymap.set("n", "<leader>th", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
	end, { desc = "[T]oggle Inlay [H]ints" })
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			-- { "j-hui/fidget.nvim",    opts = {} },
			-- "saghen/blink.cmp",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					lsp_mappings(event)
				end,
			})

			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			-- local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- local capabilities = require("cmp").get_lsp_capabilities()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()


			local servers = {
				basedpyright = {},
				ts_ls = {},
				lua_ls = {
					-- cmd = { ... },
					-- filetypes = { ... },
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							diagnostics = { disable = { "missing-fields" } },
						},
					},
				},
			}

			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				-- "stylua",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = false,
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
}
