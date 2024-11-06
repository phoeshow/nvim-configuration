return {
  "folke/which-key.nvim",
  event = "VimEnter",
  opts = {
    spec = {
      { "<leader>c", group = "Code", mode = { "n", "x" } },
      { "<leader>f", group = "Find" },
      { "<leader>w", group = "Window" },
      { "<leader>b", group = "Buffers" },
      { "<leader>g", group = "Git" },
      { "<leader>t", group = "Toggle" },
    },
  },
}
