require('neo-tree').setup({
  filesystem = {
    window = {
      mappings = {
        ["<c-o>"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "O" } },
        ["<c-o>c"] = { "order_by_created", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>d"] = { "order_by_diagnostics", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>g"] = { "order_by_git_status", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>m"] = { "order_by_modified", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>n"] = { "order_by_name", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>s"] = { "order_by_size", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>t"] = { "order_by_type", nowait = false, config = { prefix_key = "O" } }
      }
    }
  },
  git_status = {
    window = {
      position = "float",
      mappings = {
        ["<c-o>"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "O" } },
        ["<c-o>c"] = { "order_by_created", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>d"] = { "order_by_diagnostics", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>m"] = { "order_by_modified", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>n"] = { "order_by_name", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>s"] = { "order_by_size", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>t"] = { "order_by_type", nowait = false, config = { prefix_key = "O" } },
      }
    }
  },
  buffers = {
    follow_current_file = {
      enabled = true,          -- This will find and focus the file in the active buffer every time
      --              -- the current file is changed while the tree is open.
      leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
    },
    group_empty_dirs = true,   -- when true, empty folders will be grouped together
    show_unloaded = true,
    window = {
      mappings = {
        ["<c-o>"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "O" } },
        ["<c-o>c"] = { "order_by_created", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>d"] = { "order_by_diagnostics", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>m"] = { "order_by_modified", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>n"] = { "order_by_name", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>s"] = { "order_by_size", nowait = false, config = { prefix_key = "O" } },
        ["<c-o>t"] = { "order_by_type", nowait = false, config = { prefix_key = "O" } },
      }
    },
  },

  window = {
    position = "left",
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<space>"] = {
        "toggle_node",
        nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
      },
      ["<2-LeftMouse>"] = "open",
      ["o"] = "open",
      ["<esc>"] = "cancel", -- close preview or floating neo-tree window
      ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
      -- Read `# Preview Mode` for more information
      ["l"] = "focus_preview",
      ["S"] = "open_split",
      ["s"] = "open_vsplit",
      -- ["S"] = "split_with_window_picker",
      -- ["s"] = "vsplit_with_window_picker",
      ["t"] = "open_tabnew",
      -- ["<cr>"] = "open_drop",
      -- ["t"] = "open_tab_drop",
      ["w"] = "open_with_window_picker",
      --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
      ["C"] = "close_node",
      -- ['C'] = 'close_all_subnodes',
      ["z"] = "close_all_nodes",
      --["Z"] = "expand_all_nodes",
      ["a"] = {
        "add",
        -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "absolute" -- "none", "relative", "absolute"
        }
      },
      ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
      -- ["c"] = {
      --  "copy",
      --  config = {
      --    show_path = "none" -- "none", "relative", "absolute"
      --  }
      --}
      ["m"] = {
        "move",
        config = {
          show_path = "absolute" -- "none", "relative", "absolute"
        }
      },                         -- takes text input for destination, also accepts the optional config.show_path option like "add".
      ["q"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["<"] = "prev_source",
      [">"] = "next_source",
      ["i"] = "show_file_details",
    }
  },
})


vim.keymap.set('n', '<c-f>', ':Neotree reveal position=left<cr>')
vim.keymap.set('n', '<c-t>', ':Neotree toggle<CR>')

vim.fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
  { text = "󰌵", texthl = "DiagnosticSignHint" })
