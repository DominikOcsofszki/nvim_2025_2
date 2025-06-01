vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

local foldZ = function(level) vim.o.foldlevel = tonumber(level) end

vim.keymap.set("n", "<leader>z1", function() foldZ(1) end, {})
vim.keymap.set("n", "<leader>z2", function() foldZ(2) end, {})
vim.keymap.set("n", "<leader>z3", function() foldZ(3) end, {})
vim.keymap.set("n", "<leader>z4", function() foldZ(4) end, {})
vim.keymap.set("n", "<leader>z5", function() foldZ(5) end, {})
vim.keymap.set("n", "<leader>zz", function() foldZ(99) end, {})
