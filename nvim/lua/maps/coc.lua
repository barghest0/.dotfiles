local keyset = vim.keymap.set

local options = {silent = true}

keyset("n", "gd", "<Plug>(coc-definition)", options)
keyset("n", "td", "<Plug>(coc-type-definition)", options)
keyset("n", "gi", "<Plug>(coc-implementation)", options)
keyset("n", "gr", "<Plug>(coc-references)", options)

keyset("n", "<leader>rn", "<Plug>(coc-rename)", options)

local nowait_options = {silent = true, nowait = true}

keyset("n", "<leader>qf", "<Plug>(coc-fix-current)", nowait_options)
keyset("n", "<leader>da", "<Plug>(coc-codeaction)", nowait_options)
keyset("n", "<leader>la", "<Plug>(coc-codelens-action)", nowait_options)
