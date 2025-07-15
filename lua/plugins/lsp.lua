return {
  -- `lazydev` configures Lus LSP for your Neovim config, runtime and plugins
  -- used for completion, annotations and signatures of Neovim apis
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings

  -- Main LSP config
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("my-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          local picker = require("snacks").picker

          map("gd", picker.lsp_definitions, "Goto Definitions")
          map("gr", picker.lsp_references, "Goto References")
          map("gD", picker.lsp_declarations, "Goto Declaration")
          map("gI", picker.lsp_implementations, "Goto Implementations")
          map("gt", picker.lsp_type_definitions, "Goto Type Definitions")

          map("<leader>ca", vim.lsp.buf.code_action, "Coda Action")
          map("<leader>cr", vim.lsp.buf.rename, "Code Rename")

          map("<leader>fd", picker.diagnostics_buffer, "Find Diagnostics(Buffer)")
          map("<leader>fD", picker.diagnostics, "Find Diagnostics(Workspace)")

          map("K", function()
            vim.lsp.buf.hover({ border = "single" })
          end, "LSP: Hover")
          map("<leader>ce", function()
            vim.diagnostic.open_float({ border = "single" })
          end, "Show Diagnostic detail")

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup("my-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("my-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "my-lsp-highlight", buffer = event2.buf })
              end,
            })
          end

          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_foldingRange, event.buf) then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config({
        -- virtual_lines = {
        --   current_line = true,
        -- },
        severity_sort = true,
        float = { border = "single", source = "if_many" },
        underline = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
        },
        virtual_text = {
          source = "if_many",
          spacing = 2,
        },
      })

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = { disable = { "missing-fields" } },
              hint = {
                enable = true,
              },
            },
          },
        },

        vtsls = {},

        rust_analyzer = {},

        tailwindcss = {},

        pyright = {},

        jsonls = {
          settings = {
            json = {
              schemas = {
                { fileMatch = { "*.json", "*.jsonc" }, schema = { allowTrailingCommas = true } },
              },
            },
          },
        },

        cssls = {},

        html = {},
      }

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua", -- Used to format Lua code
        "prettierd", -- Used to format js/ts
        "isort", -- format python
        "black", -- format python
        "eslint_d", -- Used to lint js/ts
        "markdownlint", -- Markdown lint
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      require("mason-lspconfig").setup({
        automatic_enable = vim.tbl_keys(servers or {}),
      })

      for server_name, config in pairs(servers) do
        vim.lsp.config(server_name, config)
      end

      -- NOTE: Some servers may require an old setup until they are updated. For the full list refer here: https://github.com/neovim/nvim-lspconfig/issues/3705
      -- These servers will have to be manually set up with require("lspconfig").server_name.setup{}
    end,
  },
}
