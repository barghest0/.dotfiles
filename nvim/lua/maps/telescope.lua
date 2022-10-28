local options = {noremap = true}

local builtin = require('telescope.builtin')

local keyset = vim.keymap.set

keyset('n', '<leader>ff', builtin.find_files, options)
keyset('n', '<leader>fg', builtin.live_grep, options)
keyset('n', '<leader>fb', builtin.buffers, options)
keyset('n', '<leader>fh', builtin.help_tags, options)



