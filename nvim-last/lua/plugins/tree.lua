return {
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<C-t>", "<cmd>Neotree toggle<cr>", desc = "Toggle File Tree" },
			{ "<C-f>", "<cmd>Neotree filesystem reveal left<cr>", desc = "Show Current File" },
		},

		config = function()
			local neo_tree = require("neo-tree")

			neo_tree.setup({
				close_if_last_window = true, -- закрывать, если последнее окно
				popup_border_style = "rounded", -- стиль границ всплывающих окон
				enable_git_status = true, -- показывать git статус
				enable_diagnostics = true, -- показывать диагностику
				filesystem = {
					filtered_items = {
						hide_dotfiles = true, -- показывать . файлы
						hide_gitignored = false, -- показывать игнорируемые git файлы
					},
					follow_current_file = false, -- следить за текущим файлом
					group_empty_dirs = true, -- группировать пустые папки
				},
				window = {
					width = 30,
					position = "left",
					mappings = {
						["o"] = "open",
						["<cr>"] = "noop",

						["oc"] = "noop",
						["od"] = "noop",
						["og"] = "noop",
						["om"] = "noop",
						["on"] = "noop",
						["os"] = "noop",
						["ot"] = "noop",
						["ov"] = "noop",
						["ox"] = "noop",
					},
				},
				filesystem = {
					hijack_netrw = true,
					filtered_items = {
						visible = true,
					},
					window = {
						width = 40,
					},
				},
				git_status = {
					symbols = {
						added = "✚",
						modified = "✏️",
						deleted = "🗑️",
						renamed = "🔀",
						untracked = "U",
					},
				},
			})
		end,
	},
}
