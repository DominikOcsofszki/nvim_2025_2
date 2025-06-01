vim.g.have_nerd_font = true
vim.o.clipboard = "unnamedplus"
vim.o.confirm = false
vim.o.inccommand = "split"
vim.o.linebreak = true
vim.o.list = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.wrap = true
vim.opt.inccommand = "split"
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
vim.opt.mouse = "a"
vim.opt.undofile = true

-- ==================================
-- =============FOLDING==============
-- vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldclose:'
vim.o.foldenable = true
vim.o.foldexpr = 'v:lua.vim.lsp.foldexpr()'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldmethod = 'expr'
-- vim.o.foldminlines  = 4
-- vim.o.foldnestmax = 3
-- -- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
-- =============FOLDING==============
-- ==================================

