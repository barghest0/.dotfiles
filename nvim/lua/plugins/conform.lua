require("conform").setup({
  formatters_by_ft = {
    javascript = { { "prettierd", "eslintd", } },
    typescript = { { "prettierd", "eslintd", } },
    typescriptreact = { { "prettierd", "eslintd", } },
    avascriptreact = { { "prettierd", "eslintd", } },
    lua = { { "luaformatter" } }
  },
  format_after_save = {
    lsp_format = "fallback",
  },
  formatters = {
    inected = { options = { ignore_errors = true } },
    prettierd = {
      cwd = require("conform.util").root_file({ ".prettierrc.json" }),
    },
  },
})
