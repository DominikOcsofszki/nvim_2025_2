vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

local foldZ = function(level) vim.o.foldlevel = tonumber(level) end

vim.keymap.set("n", "<leader>z0", function() foldZ(0) end, {})
vim.keymap.set("n", "<leader>z1", function() foldZ(1) end, {})
vim.keymap.set("n", "<leader>z2", function() foldZ(2) end, {})
vim.keymap.set("n", "<leader>z3", function() foldZ(3) end, {})
vim.keymap.set("n", "<leader>z4", function() foldZ(4) end, {})
vim.keymap.set("n", "<leader>z5", function() foldZ(5) end, {})
vim.keymap.set("n", "<leader>zz", function() foldZ(99) end, {})


-- vim.api.nvim_create_autocmd("TextChangedI", {
-- 	pattern = "*",
-- 	callback = function()
-- 		local row, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 		local line = vim.api.nvim_get_current_line()
-- 		local new_line = line:gsub("\u{00A0}", " ")
-- 		if new_line ~= line then
-- 			vim.api.nvim_set_current_line(new_line)
-- 			vim.api.nvim_win_set_cursor(0, { row, col })
-- 		end
-- 	end
-- })
--
