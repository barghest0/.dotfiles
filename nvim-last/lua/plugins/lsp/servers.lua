local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
	local map = function(keys, func)
		vim.keymap.set("n", keys, func, { buffer = bufnr, silent = true })
	end

	map("gd", vim.lsp.buf.definition)
	map("gr", vim.lsp.buf.references)
	map("K", vim.lsp.buf.hover)
	map("<leader>rr", vim.lsp.buf.rename)
	map("<leader>da", vim.lsp.buf.code_action)
end

local servers = {
	ts_ls = {},
	gopls = {},
	kotlin_language_server = {},
}

for name, config in pairs(servers) do
	config.on_attach = on_attach
	lspconfig[name].setup(config)
end
