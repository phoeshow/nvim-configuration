return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm" },
  opts = {
    open_mapping = [[<c-\>]],
  },
  keys = {
    {
      "<C-\\>",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function(event)
        local opts = { buffer = event.buffer }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        -- vim.keymap.set("t", "<C-e>", [[<C-\><C-n>]], opts)
      end,
    })
  end,
}
