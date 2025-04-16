return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
		{ "<leader>fr", "<cmd>Telescope jumplist<cr>", desc = "Jump List" },
		{
			"<leader>fw",
			mode = "v",
			function()
				local text = table.concat(vim.fn.getline("'<", "'>"), "\n")
				require("telescope.builtin").grep_string({ search = text })
			end,
			desc = "Search Visual Selection",
		},
	},
	config = function()
		require("telescope").setup({})
	end,
}
