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
          NormalFloat = { bg = colors.mantle },
          Pmenu = { bg = colors.surface0 },
          StatusLine = { bg = colors.mantle },
          StatusLineNC = { bg = colors.mantle },
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
        fidget = true,
        blink_cmp = true,
      },
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
