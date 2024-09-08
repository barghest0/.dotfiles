return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "olimorris/neotest-rspec",
    "haydenmeade/neotest-jest",
    "zidhuss/neotest-minitest",
    "mfussenegger/nvim-dap",
    "jfpedroza/neotest-elixir",
    "weilbith/neotest-gradle",
    "nvim-neotest/neotest-go",
  },
  opts = {},
  config = function()
    local neotest = require("neotest")

    local neotest_jest = require("neotest-jest")({
      jestCommand = "npm test --",
    })
    neotest_jest.filter_dir = function(name)
      return name ~= "node_modules" and name ~= "__snapshots__"
    end

    neotest.setup({
      adapters = {
        require("neotest-rspec")({
          rspec_cmd = function()
            return vim.tbl_flatten({
              "bundle",
              "exec",
              "rspec",
            })
          end,
        }),
        neotest_jest,
        require("neotest-minitest"),
        require("neotest-elixir"),
        require("neotest-go"),
      },
      output_panel = {
        enabled = true,
        open = "botright split | resize 15",
      },
      quickfix = {
        open = false,
      },
    })
  end,
}
