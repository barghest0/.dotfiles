require("conform").setup({
  formatters_by_ft = {
    javascript = { { "eslintd", "prettierd" } },
  },
  format_on_save = {
    timeout_ms = 200,
    lsp_format = "fallback",
  },
})
