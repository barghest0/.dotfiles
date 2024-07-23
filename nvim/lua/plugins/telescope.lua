local builtin = require('telescope.builtin')

local default_opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('v', '<leader>fg', 'y<ESC>:Telescope live_grep default_text=<c-r>0<CR>', default_opts)
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>rf', builtin.resume, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', 'gd', builtin.lsp_definitions, {})
vim.keymap.set('n', 'gr', builtin.lsp_references, {})
vim.keymap.set('n', 'gi', builtin.lsp_implementations, {})
vim.keymap.set('n', 'td', builtin.lsp_type_definitions, {})

require('dressing').setup({})
