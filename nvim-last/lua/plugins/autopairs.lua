return {
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},

	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
}
