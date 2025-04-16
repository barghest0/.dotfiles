return {
	"echasnovski/mini.move",
	version = false,
	event = "VeryLazy",
	config = function()
		require("mini.move").setup({
			mappings = {
				left = "<D-h>",
				right = "<D-l>",
				down = "<D-j>",
				up = "<D-k>",

				line_left = "<D-h>",
				line_right = "<D-l>",
				line_down = "<D-j>",
				line_up = "<D-k>",
			},
		})
	end,
}
