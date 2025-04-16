return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lsp.servers")

			vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Show diagnostics under cursor" })
		end,
	},
	{
		-- надстройка над rust-analyzer
		"mrcjkb/rustaceanvim",
		version = "^6",
		ft = { "rust" },
		init = function()
			vim.g.rustaceanvim = {
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
				server = {
					on_attach = function(client, bufnr)
						local map = function(keys, func)
							vim.keymap.set("n", keys, func, { buffer = bufnr, silent = true })
						end

						map("gd", vim.lsp.buf.definition)
						map("gr", vim.lsp.buf.references)
						map("K", vim.lsp.buf.hover)
						map("<leader>rr", vim.lsp.buf.rename)
						map("<leader>da", vim.lsp.buf.code_action)
					end,
					settings = {
						["rust-analyzer"] = {
							checkOnSave = {
								command = "clippy",
							},
						},
					},
				},
			}
		end,
	},
}
