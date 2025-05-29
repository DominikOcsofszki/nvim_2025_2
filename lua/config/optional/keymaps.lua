local full_path = function()
	local fpath = vim.fn.expand("%:p")
	print(fpath)
	vim.fn.setreg("+", fpath)
end

vim.keymap.set("n", "<leader>y", full_path, {})
