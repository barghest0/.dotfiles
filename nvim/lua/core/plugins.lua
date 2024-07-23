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
    }
  },

  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
    checker = { enabled = false }
  }
})
