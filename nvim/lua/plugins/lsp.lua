return {
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup(
        {
          -- used to see debug logs in file `vim.fn.stdpath("cache") .. lsp-file-operations.log`
          debug = false,
          -- select which file operations to enable
          operations = {
            willRenameFiles = true,
            didRenameFiles = true,
            willCreateFiles = true,
            didCreateFiles = true,
            willDeleteFiles = true,
            didDeleteFiles = true,
          },
          -- how long to wait (in milliseconds) for file rename information before cancelling
          timeout_ms = 3000
        }
      )
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require("typescript-tools").setup({})
    end
  },
  {
    "aznhe21/actions-preview.nvim",
    config = function()
      require("actions-preview").setup({
        diff = {
          algorithm = "patience",
        },
        nui = {
          -- component direction. "col" or "row"
          dir = "col",
          -- keymap for selection component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu#keymap
          keymap = nil,
          -- options for nui Layout component: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/layout
          layout = {
            position = "50%",
            size = {
              width = "60%",
              height = "90%",
            },
            min_width = 40,
            min_height = 10,
            relative = "editor",
          },
          -- options for preview area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup
          preview = {
            size = "60%",
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
          },
          -- options for selection area: https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/menu
          select = {
            size = "40%",
            border = {
              style = "rounded",
              padding = { 0, 1 },
            },
          },
        },
        backend = { "telescope", "nui" },
        telescope = vim.tbl_extend(
          "force",
          -- telescope theme: https://github.com/nvim-telescope/telescope.nvim#themes
          require("telescope.themes").get_dropdown(),
          -- a table for customizing content
          {
            -- a function to make a table containing the values to be displayed.
            -- fun(action: Action): { title: string, client_name: string|nil }
            make_value = nil,

            -- a function to make a function to be used in `display` of a entry.
            -- see also `:h telescope.make_entry` and `:h telescope.pickers.entry_display`.
            -- fun(values: { index: integer, action: Action, title: string, client_name: string }[]): function
            make_make_display = nil,
          }
        ),
      })
    end,
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {                            -- Optional
        "williamboman/mason.nvim",
        build = function()
          pcall(vim.cmd, "MasonUpdate")
        end,
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },     -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      { "L3MON4D3/LuaSnip" },     -- Required
      { "rafamadriz/friendly-snippets" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
      { "saadparwaiz1/cmp_luasnip" },
      { 'yioneko/nvim-vtsls' }
    },
    config = function()
      local lsp = require("lsp-zero")

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        -- vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end,
        --   vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Reference" }))
        --
        -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
        --   vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Definition" }))

        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
          vim.tbl_deep_extend("force", opts, { desc = "LSP Hover" }))

        -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        --   vim.tbl_deep_extend("force", opts, { desc = "LSP Workspace Symbol" }))

        -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.setloclist() end,
        --   vim.tbl_deep_extend("force", opts, { desc = "LSP Show Diagnostics" }))

        -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end,
        --   vim.tbl_deep_extend("force", opts, { desc = "Next Diagnostic" }))
        --
        -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
        -- vim.tbl_deep_extend("force", opts, { desc = "Previous Diagnostic" }))

        vim.keymap.set({ "n", "v" }, "<leader>da", function() vim.lsp.buf.code_action() end,
          vim.tbl_deep_extend("force", opts, { desc = "LSP Code Action" }))

        -- vim.keymap.set("n", "<leader>grr", function() vim.lsp.buf.references() end,
        --   vim.tbl_deep_extend("force", opts, { desc = "LSP References" }))

        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.rename() end,
          vim.tbl_deep_extend("force", opts, { desc = "LSP Rename" }))

        -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
        --   vim.tbl_deep_extend("force", opts, { desc = "LSP Signature Help" }))
      end)

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = {
          "tsserver",
          "vtsls",
          "kotlin_language_server",
          "lua_ls",
          "html",
          "elixirls",
          "tailwindcss",
          "tflint",
          "pylsp",
          "dockerls",
          "bashls",
          "marksman",
          "gopls",
          "astro",
        },
        handlers = {
          lsp.default_setup,
          vtsls = function()
            require("lspconfig.configs").vtsls = require("vtsls").lspconfig
            require('lspconfig').vtsls.setup({})
          end,
          lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,
        },
      })

      local cmp_action = require("lsp-zero").cmp_action()
      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      require("luasnip.loaders.from_vscode").lazy_load()

      -- `/` cmdline setup.
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip", keyword_length = 2 },
          { name = "buffer",  keyword_length = 3 },
          { name = "path" },
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
          -- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),
          ["<Tab>"] = cmp_action.luasnip_supertab(),
          ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
        }),
      })
    end,
  } }
