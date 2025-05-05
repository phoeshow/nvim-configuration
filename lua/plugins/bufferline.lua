return {
  "akinsho/bufferline.nvim",
  enabled = false,
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
          icon = "▍",
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
}
