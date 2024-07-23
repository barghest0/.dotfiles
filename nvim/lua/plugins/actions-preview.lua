require("actions-preview").setup({
  diff = {
    algorithm = "patience",
  },
  telescope = require("telescope.themes").get_dropdown { winblend = 10 },
})
