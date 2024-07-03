local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
      { "LazyVim/LazyVim" },

      -- treesitter
      { "nvim-treesitter/nvim-treesitter" },

      -- lsm
      { "neovim/nvim-lspconfig" },

      -- scheme
      { "folke/tokyonight.nvim" },

      -- cmp
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
      {'hrsh7th/nvim-cmp'},

      -- mason (download formatters & linters)
      {"williamboman/mason.nvim"},

      -- formatting (use formatters & linters)
      {"stevearc/conform.nvim"},

      -- telescope  
      {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
      },

      -- tree
      {
          "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
      }
    },

    defaults = {
      lazy = false,
      version = false, -- always use the latest git commit
    },
    -- checker = { enabled = true }

})
