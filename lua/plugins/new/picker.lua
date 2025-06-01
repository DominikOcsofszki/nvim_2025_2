return {
	's1n7ax/nvim-window-picker',
	name = 'window-picker',
	event = 'VeryLazy',
	version = '2.*',
	config = function()
		require 'window-picker'.setup({
			hint = 'floating-letter',
			-- hint = 'floating-big-letter',
			-- selection_chars = 'FJDKSLA;CMRUEIWOQP',
			selection_chars = 'jkl;fdsa',

		})
	end,
}
