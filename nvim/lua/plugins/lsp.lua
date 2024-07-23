-- Sntup language servers.
-- oo
local lspconfig = require('lspconfig')

require("lspconfig.configs").vtsls = require("vtsls").lspconfig

lspconfig.vtsls.setup({

})

lspconfig.gopls.setup({})

lspconfig.pyright.setup {}
lspconfig.lua_ls.setup {
  on_init = function(client)
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  settings = {
    Lua = {}
  }
}

lspconfig.tsserver.setup({
})



-- Global mappings.
-- See :help vim.diagnostic.* for documentation on any of the below functions
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>pd', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>nd', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ld', vim.diagnostic.setloclist)


-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { remap = false, silent = true, buffer = ev.buf })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, opts)
  end
})
