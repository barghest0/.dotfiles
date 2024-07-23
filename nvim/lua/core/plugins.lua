local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  spec = {

    { "LazyVim/LazyVim", },
    { 'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
    {
      "MaximilianLloyd/ascii.nvim",
      requires = {
        "MunifTanjim/nui.nvim"
      }
    },
    {
      'nvimdev/dashboard-nvim',
      event = 'VimEnter',
      config = function()
        local ascii = require('ascii')
        require('dashboard').setup {
          theme = "doom",
          disable_move = true,
          config = {


          }
        }
      end,
      dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    {
      "folke/ts-comments.nvim",
      opts = {},
      event = "VeryLazy",
      enabled = vim.fn.has("nvim-0.10.0") == 1,
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
      }
    },
    {
      'rcarriga/nvim-notify',
      config = function()
        require("notify").setup {
          timeout = 50,
        }
      end
    },

    { "fedepujol/move.nvim" },
    {
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup({})
      end,
    },

    -- terminal
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = true,
    },

    -- treesitter
    { "nvim-treesitter/nvim-treesitter" },

    -- lsp
    {
      'yioneko/nvim-vtsls'
    },
    {
      "ray-x/go.nvim",
      dependencies = { -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
      },
      config = function()
        require("go").setup()
      end,
      event = { "CmdlineEnter" },
      ft = { "go", 'gomod' },
      build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },

    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "mason.nvim",
        { "williamboman/mason-lspconfig.nvim", config = function() end },
      },
    },
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
      "pmizio/typescript-tools.nvim",
      dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
      opts = {},
    },
    {
      "aznhe21/actions-preview.nvim",
      config = function()
        vim.keymap.set({ "v", "n" }, "<leader>da", require("actions-preview").code_actions)
      end,
    },

    -- scheme
    { "folke/tokyonight.nvim" },

    -- cmp
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    {
      "hrsh7th/nvim-cmp",
      dependencies = { "hrsh7th/cmp-emoji" },
    },
    { "quangnguyen30192/cmp-nvim-ultisnips" },
    { "saadparwaiz1/cmp_luasnip" },

    -- autopairs
    {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
    },
    {
      "windwp/nvim-ts-autotag",
      event = "InsertEnter",
      config = true,
    },

    -- global replace
    {
      "nvim-pack/nvim-spectre",
    },

    -- git
    {
      "kdheepak/lazygit.nvim",
      cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
      },
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      -- setting the keybinding for LazyGit with 'keys' is recommended in
      -- order to load the plugin when the command is run for the first time
      keys = {
        { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
      },
    },
    {
      "FabijanZulj/blame.nvim",
      config = function()
        require("blame").setup()
      end,
    },

    {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    -- snippets
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      build = "make install_jsregexp",
      after = "nvim-cmp",
    },
    {
      "SirVer/ultisnips",
    },
    {
      "honza/vim-snippets",
    },
    {
      "mlaursen/vim-react-snippets",
    },

    -- multi cursors
    {
      "mg979/vim-visual-multi",
    },

    -- surround
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
    },

    -- mason (download formatters & linters)
    {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },

    -- formatting (use formatters & linters)
    { "stevearc/conform.nvim" },

    -- telescope
    {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
      'stevearc/dressing.nvim',
      opts = {},
    },

    -- tree
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      },
      config = function()
        vim.fn.sign_define("DiagnosticSignError",
          { text = " ", texthl = "DiagnosticSignError" })
        vim.fn.sign_define("DiagnosticSignWarn",
          { text = " ", texthl = "DiagnosticSignWarn" })
        vim.fn.sign_define("DiagnosticSignInfo",
          { text = " ", texthl = "DiagnosticSignInfo" })
        vim.fn.sign_define("DiagnosticSignHint",
          { text = "󰌵", texthl = "DiagnosticSignHint" })

        require("neo-tree").setup({
          close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
          popup_border_style = "rounded",
          enable_git_status = true,
          enable_diagnostics = true,
          open_files_do_not_replace_types = { "terminal", "trouble", "qf" }, -- when opening files, do not use windows containing these filetypes or buftypes
          sort_case_insensitive = false,                                     -- used when sorting files and directories in the tree
          sort_function = nil,                                               -- use a custom function for sorting files and directories in the tree
          -- sort_function = function (a,b)
          --       if a.type == b.type then
          --           return a.path > b.path
          --       else
          --           return a.type > b.type
          --       end
          --   end , -- this sorts files and directories descendantly
          default_component_configs = {
            container = {
              enable_character_fade = true
            },
            indent = {
              indent_size = 2,
              padding = 1, -- extra padding on left hand side
              -- indent guides
              with_markers = true,
              indent_marker = "│",
              last_indent_marker = "└",
              highlight = "NeoTreeIndentMarker",
              -- expander config, needed for nesting files
              with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
              expander_collapsed = "",
              expander_expanded = "",
              expander_highlight = "NeoTreeExpander",
            },
            icon = {
              folder_closed = "",
              folder_open = "",
              folder_empty = "󰜌",
              -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
              -- then these will never be used.
              default = "*",
              highlight = "NeoTreeFileIcon"
            },
            modified = {
              symbol = "[+]",
              highlight = "NeoTreeModified",
            },
            name = {
              trailing_slash = false,
              use_git_status_colors = true,
              highlight = "NeoTreeFileName",
            },
            git_status = {
              symbols = {
                -- Change type
                added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
                modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
                deleted   = "✖", -- this can only be used in the git_status source
                renamed   = "󰁕", -- this can only be used in the git_status source
                -- Status type
                untracked = "",
                ignored   = "",
                unstaged  = "󰄱",
                staged    = "",
                conflict  = "",
              }
            },
            -- If you don't want to use these columns, you can set `enabled = false` for each of them individually
            file_size = {
              enabled = true,
              required_width = 64, -- min width of window required to show this column
            },
            type = {
              enabled = true,
              required_width = 122, -- min width of window required to show this column
            },
            last_modified = {
              enabled = true,
              required_width = 88, -- min width of window required to show this column
            },
            created = {
              enabled = true,
              required_width = 110, -- min width of window required to show this column
            },
            symlink_target = {
              enabled = false,
            },
          },
          -- A list of functions, each representing a global custom command
          -- that will be available in all sources (if not overridden in `opts[source_name].commands`)
          -- see `:h neo-tree-custom-commands-global`
          commands = {},
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
              ["o"] = { "open" },
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
                  show_path = "none" -- "none", "relative", "absolute"
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
              ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
              ["q"] = "close_window",
              ["R"] = "refresh",
              ["?"] = "show_help",
              ["<"] = "prev_source",
              [">"] = "next_source",
              ["i"] = "show_file_details",
            }
          },
          nesting_rules = {},
          filesystem = {
            filtered_items = {
              visible = false, -- when true, they will just be displayed differently than normal items
              hide_dotfiles = true,
              hide_gitignored = true,
              hide_hidden = true, -- only works on Windows for hidden files/directories
              hide_by_name = {
                --"node_modules"
              },
              hide_by_pattern = { -- uses glob style patterns
                --"*.meta",
                --"*/src/*/tsconfig.json",
              },
              always_show = { -- remains visible even if other settings would normally hide it
                --".gitignored",
              },
              always_show_by_pattern = { -- uses glob style patterns
                --".env*",
              },
              never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
                --".DS_Store",
                --"thumbs.db"
              },
              never_show_by_pattern = { -- uses glob style patterns
                --".null-ls_*",
              },
            },
            follow_current_file = {
              enabled = false,                      -- This will find and focus the file in the active buffer every time
              --               -- the current file is changed while the tree is open.
              leave_dirs_open = false,              -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
            },
            group_empty_dirs = false,               -- when true, empty folders will be grouped together
            hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
            -- in whatever position is specified in window.position
            -- "open_current",  -- netrw disabled, opening a directory opens within the
            -- window like netrw would, regardless of window.position
            -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
            use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
            -- instead of relying on nvim autocmd events.
            window = {
              mappings = {
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["H"] = "toggle_hidden",
                ["/"] = "fuzzy_finder",
                ["D"] = "fuzzy_finder_directory",
                ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                -- ["D"] = "fuzzy_sorter_directory",
                ["f"] = "filter_on_submit",
                ["<c-x>"] = "clear_filter",
                ["[g"] = "prev_git_modified",
                ["]g"] = "next_git_modified",
                ["<c-o>"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "<c-o>" } },
                ["<c-oc>"] = { "order_by_created", nowait = false },
                ["<c-od>"] = { "order_by_diagnostics", nowait = false },
                ["<c-og>"] = { "order_by_git_status", nowait = false },
                ["<c-om>"] = { "order_by_modified", nowait = false },
                ["<c-on>"] = { "order_by_name", nowait = false },
                ["<c-os>"] = { "order_by_size", nowait = false },
                ["<c-ot>"] = { "order_by_type", nowait = false },
                -- ['<key>'] = function(state) ... end,
              },
              fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                ["<down>"] = "move_cursor_down",
                ["<c-n>"] = "move_cursor_down",
                ["<up>"] = "move_cursor_up",
                ["<c-p>"] = "move_cursor_up",
                -- ['<key>'] = function(state, scroll_padding) ... end,
              },
            },

            commands = {} -- Add a custom command or override a global one using the same function name
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
                ["bd"] = "buffer_delete",
                ["<bs>"] = "navigate_up",
                ["."] = "set_root",
                ["<c-o>"] = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "<c-o>" } },
                ["<c-oc>"] = { "order_by_created", nowait = false },
                ["<c-od>"] = { "order_by_diagnostics", nowait = false },
                ["<c-om>"] = { "order_by_modified", nowait = false },
                ["<c-on>"] = { "order_by_name", nowait = false },
                ["<c-os>"] = { "order_by_size", nowait = false },
                ["<c-ot>"] = { "order_by_type", nowait = false },
              }
            },
          },
          git_status = {
            window = {
              position = "float",
              mappings = {
                ["A"]      = "git_add_all",
                ["gu"]     = "git_unstage_file",
                ["ga"]     = "git_add_file",
                ["gr"]     = "git_revert_file",
                ["gc"]     = "git_commit",
                ["gp"]     = "git_push",
                ["gg"]     = "git_commit_and_push",
                ["<c-o>"]  = { "show_help", nowait = false, config = { title = "Order by", prefix_key = "<c-o>" } },
                ["<c-oc>"] = { "order_by_created", nowait = false },
                ["<c-od>"] = { "order_by_diagnostics", nowait = false },
                ["<c-om>"] = { "order_by_modified", nowait = false },
                ["<c-on>"] = { "order_by_name", nowait = false },
                ["<c-os>"] = { "order_by_size", nowait = false },
                ["<c-ot>"] = { "order_by_type", nowait = false },
              }
            }
          }
        })
      end
    }
  },

  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
    checker = { enabled = false }
  }
})
