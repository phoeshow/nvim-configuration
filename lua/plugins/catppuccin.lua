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
          BlinkCmpSignatureHelp = { bg = colors.surface0 },
          -- StatusLine = { bg = colors.crust },
          -- StatusLineNC = { bg = colors.mantle },
          GitSignsChange = { fg = colors.peach },
        }
      end,
      highlight_overrides = {
        mocha = function(colors)
          return {
            CursorLine = { bg = utils.darken(colors.surface0, 0.8, colors.base) },
          }
        end,
      },
      integrations = {
        blink_cmp = true,
        snacks = {
          enabled = true,
          indent_scope_color = "peach",
        },
      },
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
