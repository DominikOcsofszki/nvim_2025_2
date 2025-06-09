local create_autocmd_ft_incc = function()
	vim.filetype.add({
		extension = {
			incc = 'incc',
			incc24 = 'incc',
		},
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "incc",
			callback = function()
				vim.bo.commentstring = "# %s"
			end,
		})
	})
end

create_autocmd_ft_incc()
vim.lsp.enable("incc_lsp")
