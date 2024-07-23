require("bufferline").setup({
  highlights = {
    buffer_selected = { bold = true },
    diagnostic_selected = { bold = true },
    info_selected = { bold = true },
    info_diagnostic_selected = { bold = true },
    warning_selected = { bold = true },
    warning_diagnostic_selected = { bold = true },
    error_selected = { bold = true },
    error_diagnostic_selected = { bold = true },
  },
  options = {
    show_close_icon = false,
    diagnostics = "nvim_lsp",
  }
})

vim.keymap.set('n', 'gT', ':BufferLineCyclePrev<CR>', {})
vim.keymap.set('n', 'gt', ':BufferLineCycleNext<CR>', {})
vim.keymap.set('n', 'cot', ':BufferLineCloseOthers<CR>', {})
vim.keymap.set('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', {})
vim.keymap.set('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', {})
vim.keymap.set('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', {})
vim.keymap.set('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', {})
vim.keymap.set('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', {})
vim.keymap.set('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', {})
vim.keymap.set('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', {})
vim.keymap.set('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', {})
vim.keymap.set('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', {})
vim.keymap.set('n', '<leader>$', ':BufferLineGoToBuffer -1<CR>', {})
