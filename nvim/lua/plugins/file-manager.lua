return {
	{
		"stevearc/dressing.nvim",
		opts = {},
		config = function()
			require("dressing").setup({})
		end,
	},
	{
		"junegunn/fzf",
		build = ":call fzf#install()",
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-live-grep-args.nvim" },
	{
		"exosyphon/telescope-color-picker.nvim",
		config = function()
			vim.keymap.set("n", "<leader>uC", "<cmd>Telescope colors<CR>", { desc = "Telescope Color Picker" })
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = {
			"ThePrimeagen/harpoon",
			"nvim-lua/plenary.nvim",
			"joshmedeski/telescope-smart-goto.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("v", "<leader>fg", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", default_opts)
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>rf", builtin.resume, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

			vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
			vim.keymap.set("n", "gr", builtin.lsp_references, {})
			vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
			vim.keymap.set("n", "td", builtin.lsp_type_definitions, {})

			-- vim.keymap.set(
			-- 	"n",
			-- 	"<leader>fc",
			-- 	'<cmd>lua require("telescope.builtin").live_grep({ glob_pattern = "!{spec,test}"})<CR>',
			-- 	{ desc = "Live Grep Code" }
			-- )

			-- vim.keymap.set("n", "<leader>/", function()
			-- 	-- You can pass additional configuration to telescope to change theme, layout, etc.
			-- 	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
			-- 		winblend = 10,
			-- 		previewer = false,
			-- 		layout_config = { width = 0.7 },
			-- 	}))
			-- end, { desc = "[/] Fuzzily search in current buffer" })

			local telescope = require("telescope")
			-- local telescopeConfig = require("telescope.config")

			-- Clone the default Telescope configuration
			-- local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

			-- I want to search in hidden/dot files.
			-- table.insert(vimgrep_arguments, "--hidden")
			-- I don't want to search in the `.git` directory.
			-- table.insert(vimgrep_arguments, "--glob")
			-- table.insert(vimgrep_arguments, "!**/.git/*")

			-- local actions = require("telescope.actions")

			-- local select_one_or_multi = function(prompt_bufnr)
			-- 	local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
			-- 	local multi = picker:get_multi_selection()
			-- 	if not vim.tbl_isempty(multi) then
			-- 		require("telescope.actions").close(prompt_bufnr)
			-- 		for _, j in pairs(multi) do
			-- 			if j.path ~= nil then
			-- 				vim.cmd(string.format("%s %s", "edit", j.path))
			-- 			end
			-- 		end
			-- 	else
			-- 		require("telescope.actions").select_default(prompt_bufnr)
			-- 	end
			-- end

			telescope.setup({
				-- defaults = {
				-- 	-- `hidden = true` is not supported in text grep commands.
				-- 	vimgrep_arguments = vimgrep_arguments,
				-- 	path_display = { "truncate" },
				-- 	mappings = {
				-- 		n = {
				-- 			["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
				-- 		},
				-- 		i = {
				-- 			["<C-j>"] = actions.cycle_history_next,
				-- 			["<C-k>"] = actions.cycle_history_prev,
				-- 			["<CR>"] = select_one_or_multi,
				-- 			["<C-w>"] = actions.send_selected_to_qflist + actions.open_qflist,
				-- 			["<C-S-d>"] = actions.delete_buffer,
				-- 			["<C-s>"] = actions.cycle_previewers_next,
				-- 			["<C-a>"] = actions.cycle_previewers_prev,
				-- 		},
				-- 	},
				-- },
				-- pickers = {
				-- 	find_files = {
				-- 		-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
				-- 		find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				-- 	},
				-- },
				-- extensions = {
				-- 	undo = {
				-- 		use_delta = true,
				-- 		use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
				-- 		side_by_side = false,
				-- 		vim_diff_opts = { ctxlen = vim.o.scrolloff },
				-- 		entry_format = "state #$ID, $STAT, $TIME",
				-- 		mappings = {
				-- 			i = {
				-- 				["<C-cr>"] = require("telescope-undo.actions").yank_additions,
				-- 				["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
				-- 				["<cr>"] = require("telescope-undo.actions").restore,
				-- 			},
				-- 		},
				-- 	},
				-- },
			})

			-- require("telescope").load_extension("neoclip")
			-- require("telescope").load_extension("fzf")

			-- require("telescope").load_extension("ui-select")
			-- vim.g.zoxide_use_select = true

			-- require("telescope").load_extension("undo")

			-- require("telescope").load_extension("advanced_git_search")

			-- require("telescope").load_extension("live_grep_args")

			-- require("telescope").load_extension("colors")

			-- require("telescope").load_extension("noice")
		end,
	},
}
