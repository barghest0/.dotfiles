return {
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_no_tab_map = true -- Отключает стандартный Tab для Copilot
			vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
			vim.g.copilot_filetypes = {
				["*"] = false, -- Выключить везде по умолчанию
				lua = true, -- Включить для Lua
				javascript = true,
				javascriptreact = true,
				typescriptreact = true,
				typescript = true,
				python = true,
				kotlin = true,
			}
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken", -- Only on MacOS or Linux
		config = function()
			require("CopilotChat").setup({})
		end,
	},
}
