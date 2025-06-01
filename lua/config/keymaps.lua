vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {})
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {})
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {})
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {})

vim.keymap.set('n', 'Y', '"xyy"xp', {})
vim.keymap.set('n', 'vv', 'V', {})
vim.keymap.set('n', 'cw', '"_ciw', {})
vim.keymap.set('n', 'ci"', '"_ci"', {})
vim.keymap.set('n', 'ci\'', '"_ci\'', {})

vim.keymap.set('n', '\\', function() vim.cmd("w") end, {})
vim.keymap.set('n', '|', function() vim.cmd("q") end, {})

vim.keymap.set('i', 'jj', '<esc>', {})
vim.keymap.set('i', 'jk', '<esc>', {})
vim.keymap.set('i', 'kk', '<esc>', {})
vim.keymap.set('i', 'kj', '<esc>', {})
