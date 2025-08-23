return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    ensure_installed = {
      "lua",
      "bash",
      "markdown",
      "markdown_inline",
      "vim",
      "vimdoc",
    },
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["if"] = {
            query = "@function.inner",
            desc = "Select inner of a function",
          },
          ["af"] = {
            query = "@function.outer",
            desc = "Select outer of a function",
          },
          ["ia"] = {
            query = "@parameter.inner",
            desc = "Select inner of a parameter",
          },
          ["aa"] = {
            query = "@parameter.outer",
            desc = "Select outer of a parapeter",
          },
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]f"] = {
            query = "@function.outer",
            desc = "Jump to next function start",
          },
          ["]a"] = {
            query = "@parameter.inner",
            desc = "Jump to next parameter",
          },
        },
        goto_previous_start = {
          ["[f"] = {
            query = "@function.outer",
            desc = "Jump to previous function start",
          },
          ["[a"] = {
            query = "@parameter.inner",
            desc = "Jump to previous parameter",
          },
        },
      },
    },
  },
}
