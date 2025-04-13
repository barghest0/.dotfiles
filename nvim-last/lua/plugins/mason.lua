return {
  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "ts_ls", "gopls", "rust_analyzer", "kotlin_language_server",
        },
        automatic_installation = true,
      })
    end,
  },
}

