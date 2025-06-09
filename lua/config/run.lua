local command_templates = {
	sh = '!sh %',
	zsh = '!sh %',
	lua = 'luafile %',
	python = '!python %',
	py = '!python %',
	javascript = '!node %',
	typescript = '!ts-node %',
	ruby = '!ruby %',
	perl = '!perl %',
	php = '!php %',
	go = '!go run %',
	c = '!gcc % -o out && ./out',
	cpp = '!g++ % -o out && ./out',
}

local run = function()
	vim.cmd("w")
	local ft = vim.bo.filetype
	local cmd = command_templates[ft]
	if cmd then
		vim.print(cmd)
		vim.cmd(cmd)
	else
		vim.print("command for: " .. ft .. " does not exist")
	end
end


vim.keymap.set('n', '<leader>r', run, {})
