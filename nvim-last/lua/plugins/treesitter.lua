return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"lua",
				"javascript",
				"typescript",
				"tsx",
				"go",
				"rust",
				"kotlin",
				"json",
				"html",
				"xml",
				"yaml",
			},
			highlight = { enable = true },
		})
	end,
}
