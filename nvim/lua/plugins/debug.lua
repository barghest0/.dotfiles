return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      config = function(_, opts)
        local dap = require("dap")
        local dapui = require("dapui")
        dap.set_log_level('INFO')
        dapui.setup(opts)
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open({})
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close({})
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close({})
        end
      end,
    },
    {
      "suketa/nvim-dap-ruby",
      config = function()
        require("dap-ruby").setup()
      end,
    },
    {
      "leoluz/nvim-dap-go",
      config = function()
        require("dap-go").setup()
      end,
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {},
    },
    { "jbyuki/one-small-step-for-vimkind", module = "osv" },
  },
}
