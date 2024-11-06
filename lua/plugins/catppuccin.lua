return {
  "catppuccin/nvim",
  name = "catppuccin",
  prority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = true,
      integrations = {
        fidget = true,
        blink_cmp = true,
        mini = {
          enabled = true,
          indentscope_color = "peach",
        },
        telescope = {
          enabled = true,
        },
      },
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
