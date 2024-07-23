require('move').setup({})

local opts = {}

vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
vim.keymap.set('n', '<D-l>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('n', '<D-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<D-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<D-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)


vim.keymap.set('v', '<D-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<D-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<D-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<D-l>', ':MoveHBlock(1)<CR>', opts)
