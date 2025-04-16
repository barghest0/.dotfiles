return {
	"mbbill/undotree",
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "UndoTree Toggle" },
	},
	config = function()
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_WindowLayout = 4
	end,
}
