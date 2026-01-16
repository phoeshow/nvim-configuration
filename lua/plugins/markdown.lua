return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  opts = {
    heading = {
      icons = { "󰎥 ", "󰎨 ", "󰎫 ", "󰎲 ", "󰎯 ", "󰎴 " },
      width = "block",
      min_width = 80,
    },
    pipe_table = {
      preset = "round",
    },
  },
  ft = { "markdown" },
}
