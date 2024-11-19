return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufNewFile", "BufRead" },
  main = "ibl",
  opts = {
    scope = {
      enabled = false,
    },
    exclude = {
      filetypes = {
        "dashboard",
      },
    },
  },
}
