local options = {noremap = true}

vim.api.nvim_set_keymap('n', '<C-t>', ':NERDTreeToggle<CR>', options)
vim.api.nvim_set_keymap('n', '<C-f>', ':NERDTreeFind<CR>', options)
vim.api.nvim_set_keymap('n', '<leader>n', ':NERDTreeFocus<CR>', options)
