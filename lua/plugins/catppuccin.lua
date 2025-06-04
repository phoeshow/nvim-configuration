return {
  "catppuccin/nvim",
  name = "catppuccin",
  prority = 1000,
  config = function()
    local utils = require("catppuccin.utils.colors")
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      custom_highlights = function(colors)
        return {
          BlinkCmpDoc = { bg = colors.mantle },
          BlinkCmpMenu = { bg = colors.surface0 },
          BlinkCmpSignatureHelp = { bg = colors.mantle },
          BlinkCmpSignatureHelpActiveParameter = { bg = colors.surface1, bold = true, italic = true },
          NoicePopup = { bg = colors.mantle },
          CursorLine = { bg = utils.darken(colors.surface1, 0.75, colors.base) },
        }
      end,
      integrations = {
        blink_cmp = true,
        diffview = true,
        noice = true,
        snacks = {
          enabled = true,
          indent_scope_color = "peach",
        },
      },
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
