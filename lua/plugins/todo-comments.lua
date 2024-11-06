return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODO comments" },
  },
  opts = {
    keywords = {
      NOTE = {
        icon = "󰍩",
      },
    },
  },
}
