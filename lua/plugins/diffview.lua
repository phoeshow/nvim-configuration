return {
  "sindrets/diffview.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      "<leader>gd",
      "<cmd>DiffviewOpen<cr>",
      desc = "Open Diffview",
    },
    {
      "<leader>gh",
      "<cmd>DiffviewFileHistory %<cr>",
      desc = "View current file history",
    },
  },
  opts = {
    view = {
      merge_tool = {
        layout = "diff3_mixed",
      },
    },
  },
}
