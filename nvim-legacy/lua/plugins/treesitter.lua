require('nvim-treesitter.configs').setup({
  ensure_installed = { "c", "lua", "vim", "typescript", "tsx", "javascript", "kotlin" },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
})
