return {
	{
		"folke/tokyonight.nvim",
		config = function()
			vim.cmd("colorscheme tokyonight-night")
			require("tokyonight").setup({
				style = "night",
				transparent = true,
				terminal_colors = true,
				styles = {
					comments = { italic = true },
					functions = { bold = true },
					variables = { bold = true },
					keywords = { italic = true },
				},
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		confij = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"typescript",
					"tsx",
					"go",
					"rust",
					"kotlin",
					"json",
				},
				highlight = { enable = true },
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = { "NvimTree", "neo-tree" }, -- Отключаем для деревьев файлов
				},
				sections = {
					lualine_a = { "mode" }, -- Отображение текущего режима (нормальный, вставка, визуальный и т.д.)
					lualine_b = {
						"branch", -- Отображение текущей ветки
						{
							"diff", -- Отображение различий (если есть)
							symbols = { added = "+", modified = "~", removed = "-" },
						},
						"diagnostics", -- Диагностика (ошибки, предупреждения)
					},
					lualine_c = {
						"filename", -- Имя файла
						"lsp_progress", -- Прогресс LSP (если есть)
					},
					lualine_x = { "encoding", "fileformat", "filetype" }, -- Кодировка, формат файла и тип файла
					lualine_y = { "progress" }, -- Прогресс (строка/столбец)
					lualine_z = { "location" }, -- Текущая строка и позиция
				},
				extensions = { "fugitive", "neo-tree" }, -- Расширения для интеграции с git и деревом файлов
			})
		end,
	},
}
