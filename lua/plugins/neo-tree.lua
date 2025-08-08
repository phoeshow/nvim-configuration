local function on_move(data)
  Snacks.rename.on_rename_file(data.source, data.destination)
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    window = { width = 30 },
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          vim.cmd("Neotree close")
        end,
      },
      {
        event = "file_moved",
        handler = on_move,
      },
      {
        event = "file_renamed",
        handler = on_move,
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
