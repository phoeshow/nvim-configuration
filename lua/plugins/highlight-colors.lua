return {
  "brenoprata10/nvim-highlight-colors",
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("nvim-highlight-colors").setup({
      enable_tailwind = true,
    })

    vim.keymap.set("n", "<leader>tc", require("nvim-highlight-colors").toggle, { desc = "Toggle highlight colors" })
  end,
}
