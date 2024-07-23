require("conform").setup({
  formatters_by_ft = {
    javascript = { { "eslintd", "prettierd", stop_after_first = true } },
    typescript = { { "eslintd", "prettierd", stop_after_first = true } },
    typescriptreact = { { "eslintd", "prettierd", stop_after_first = true } },
    javascriptreact = { { "eslintd", "prettierd", stop_after_first = true } },
    lua = { { "luaformatter", stop_after_first = true } }
  },

  format_after_save = {
    lsp_format = "fallback",
  },
  formatters = {
    injected = { options = { ignore_errors = true } },
    prettierd = {
      cwd = require("conform.util").root_file({ ".prettierrc.json" }),
    },
  },
})
