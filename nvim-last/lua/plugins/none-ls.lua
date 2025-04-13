return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"javascript",
						"typescript",
						"typescriptreact",
						"json",
						"html",
						"css",
						"yaml",
						"markdown",
					},
				}),
				null_ls.builtins.formatting.gofmt,
				null_ls.builtins.formatting.goimports,
				-- null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.formatting.ktlint,
				null_ls.builtins.formatting.stylua,
			},
			-- Берет по файлтипу какой-то из тулзов (formatter, linter etc), прогоняет их через локальные конфиги (.prettierc) и с учетом их форматирует или как-то изменяет наш файл
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ timeout_ms = 3000 })
						end,
					})
				end

				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"R",
					"<cmd>lua vim.lsp.buf.format({timeout_ms = 3000})<CR>",
					{ noremap = true, silent = true }
				)
			end,
		})
	end,
}
