return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>c", group = "Code", mode = { "n", "x" } },
      { "<leader>f", group = "Find" },
      { "<leader>w", group = "Window" },
      { "<leader>b", group = "Buffers" },
      { "<leader>g", group = "Git" },
      { "<leader>h", group = "Git Hunk" },
      { "<leader>t", group = "Toggle" },
      { "<leader>u", group = "UI" },
      { "<leader>d", group = "Debug" },
      { "<leader>s", group = "Search" },
    },
  },
}
