require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "kotlin_language_server",
    "tsserver",
  },
})

require('luasnip').setup({})
