return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",
    {
      "mxsdev/nvim-dap-vscode-js",
      dependencies = {
        "microsoft/vscode-js-debug",
        version = "1.x",
        build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
      },
      config = function()
        require("dap-vscode-js").setup({
          -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
          debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
          -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
          adapters = {
            "chrome",
            "pwa-node",
            "pwa-chrome",
            "pwa-msedge",
            "node-terminal",
            "pwa-extensionHost",
            "node",
            "chrome",
          }, -- which adapters to register in nvim-dap
          -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
          -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
          -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
        })
      end,
    },
  },
  keys = {
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Debug: Toggle Breakpoint",
    },
    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint()
      end,
      desc = "Debug: Set Breakpoint",
    },
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      desc = "Debug: Start/Continue",
    },
    {
      "<F6>",
      function()
        require("dap").step_over()
      end,
      desc = "Debug: Step Over",
    },
    {
      "<F7>",
      function()
        require("dap").step_into()
      end,
      desc = "Debug: Step Into",
    },
    {
      "<F8>",
      function()
        require("dap").step_out()
      end,
      desc = "Debug: Step Out",
    },
  },

  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("mason-nvim-dap").setup({
      automatic_installation = true,
      handlers = {},
      ensure_installed = {},
    })

    dapui.setup({})

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    local js_base_langurage = { "javascript", "typescript", "javascriptreact", "typescriptreact" }

    for _, langurage in ipairs(js_base_langurage) do
      dap.configurations[langurage] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-chrome",
          request = "launch",
          name = 'Start Chrome with "localhost"',
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
          userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
        },
        {
          -- use nvim-dap-vscode-js's pwa-chrome debug adapter
          type = "pwa-chrome",
          request = "launch",
          -- name of the debug action
          name = "Launch Chrome to debug client side code(vite)",
          -- default vite dev server url
          url = "http://localhost:5173",
          -- for TypeScript/Svelte
          sourceMaps = true,
          webRoot = "${workspaceFolder}/src",
          protocol = "inspector",
          port = 9222,
          -- skip files from vite's hmr
          skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
        },
      }
    end
  end,
}
