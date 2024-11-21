return {
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = { "BufNewFile", "BufRead" },
    opts = {
      options = {
        try_as_border = true,
        border = "both",
      },
    },
    init = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        desc = "Disable indentscope line for certain filetypes",
        pattern = {
          "dashboard",
          "help",
          "lspinfo",
          "lazy",
          "mason",
          "neo-tree",
          "Outline",
          "toggleterm",
          "checkhealth",
          "notify",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
