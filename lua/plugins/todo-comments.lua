return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  keys = {
    {
      "<leader>ft",
      function()
        require("snacks").picker.todo_comments()
      end,
      desc = "Find TODO comments",
    },
  },
  opts = {
    keywords = {
      NOTE = {
        icon = "󰍩",
      },
    },
  },
}
