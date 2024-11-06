return {
  {
    "lukas-reineke/indent-blankline.nvim",
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
  },
  {
    "echasnovski/mini.indentscope",
    version = "*",
    opts = {
      options = {
        try_as_border = true,
        border = "both",
      },
    },
    init = function()
      -- Disable for certain filetypes
      vim.api.nvim_create_autocmd({ "FileType" }, {
        desc = "Disable indentscope for certain filetypes",
        pattern = {
          "dashboard",
          "help",
          "lspinfo",
          "lazy",
          "mason",
          "neo-tree",
          "neogitstatus",
          "notify",
          "toggleterm",
          "Trouble",
          "checkhealth",
          "lspsaga",
          "NvimTree",
          "Outline",
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
