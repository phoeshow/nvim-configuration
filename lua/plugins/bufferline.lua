return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local bufferline = require("bufferline")
      local colors = require("catppuccin.palettes").get_palette("mocha")
      bufferline.setup({
        options = {
          diagnostics = false,
          indicator = {
            style = "icon",
          },
          offsets = {
            {
              filetype = "neo-tree",
              text = "File Explorer",
              text_align = "left",
              separator = true,
            },
            {
              filetype = "Outline",
              text = "Outline",
              text_align = "left",
              separator = true,
            },
          },
          show_buffer_close_icons = false,
        },
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
      })
    end,
  },
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
        desc = "Delete buffer",
      },
    },
  },
}
