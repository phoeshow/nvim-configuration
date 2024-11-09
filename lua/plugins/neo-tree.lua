return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {
      "s1n7ax/nvim-window-picker",
      name = "window-picker",
      version = "2.*",
      opts = {
        filter_rules = {
          bo = {
            filetype = { "Outline" },
          },
        },
      },
    },
  },
  cmd = "Neotree",
  opts = {
    window = { width = 30 },
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          vim.cmd("Neotree close")
        end,
      },
    },
  },
  keys = {
    { "<leader>fe", "<cmd>Neotree filesystem reveal<cr>", desc = "File Explorer" },
    { "<leader>be", "<cmd>Neotree buffers reveal<cr>", desc = "Buffers Explorer" },
    { "<leader>ge", "<cmd>Neotree git_status reveal<cr>", desc = "Git status Explorer" },
    { "<leader>e", "<leader>fe", desc = "File Explorer", remap = true },
  },
}
