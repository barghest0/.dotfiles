require("typescript-tools").setup({

})





vim.keymap.set('n', 'Ai', ':TSToolsAddMissingImports<CR>', {})
vim.keymap.set('n', 'Oi', ':TSToolsOrganizeImports<CR>', {})
vim.keymap.set('n', 'Ru', ':TSToolsRemoveUnused<CR>', {})
