return {
  {
    "echasnovski/mini.bufremove",
    version = "*",
    opts = {},
    keys = {
      {
        "<leader>bd",
        function()
          local bd = require("mini.bufremove").delete

          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete Buffer",
      },
    },
  },
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = { "BufNewFile", "BufRead" },
    opts = {
      options = {
        try_as_border = true,
        border = "both",
      },
    },
    init = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        desc = "Disable indentscope line for certain filetypes",
        pattern = {
          "dashboard",
          "help",
          "lspinfo",
          "lazy",
          "mason",
          "neo-tree",
          "Outline",
          "toggleterm",
          "checkhealth",
          "notify",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
