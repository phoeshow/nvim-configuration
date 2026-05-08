return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local TS = require("nvim-treesitter")
      local parsers = { "bash", "c", "diff", "html", "lua", "luadoc", "markdown", "markdown_inline", "query", "vim", "vimdoc" }
      -- ensure installed
      TS.install(parsers)

      ---@param buf integer
      ---@param language string
      local function treesitter_try_attach(buf, language)
        -- check if parser exists and load it
        if not vim.treesitter.language.add(language) then
          return
        end
        -- enable syntax highlight and other treesitter features
        vim.treesitter.start(buf, language)

        -- enable treesitter based folds
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldmethod = "expr"

        -- treesitter indentation
        local has_indent_query = vim.treesitter.query.get(language, "indents") ~= nil
        if has_indent_query then
          vim.bo.indentexpr = "v:lua.require 'nvim-treesitter'.indentexpr()"
        end
      end

      local available_parsers = TS.get_available()
      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local buf, filetype = args.buf, args.match

          local language = vim.treesitter.language.get_lang(filetype)
          if not language then
            return
          end

          local installed_parsers = TS.get_installed("parsers")

          if vim.tbl_contains(installed_parsers, language) then
            -- enable the parser if it is installed
            treesitter_try_attach(buf, language)
          elseif vim.tbl_contains(available_parsers, language) then
            -- if a parser is available in `nvim-treesitter` auto install it, and enable it after the installation is done
            require("nvim-treesitter").install(language):await(function()
              treesitter_try_attach(buf, language)
            end)
          else
            -- try to enable treesitter features in case the parser exists but is not available from `nvim-treesitter`
            treesitter_try_attach(buf, language)
          end
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          -- You can choose the select mode (default is charwise 'v')
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * method: eg 'v' or 'o'
          -- and should return the mode ('v', 'V', or '<c-v>') or a table
          -- mapping query_strings to modes.
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "<c-v>", -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          --
          -- Can also be a function which gets passed a table with the keys
          -- * query_string: eg '@function.inner'
          -- * selection_mode: eg 'v'
          -- and should return true of false
          include_surrounding_whitespace = false,
        },

        move = {
          set_jumps = true,
        },
      })

      -- select textobjects
      vim.keymap.set({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ac", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ic", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "aa", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
      end)
      vim.keymap.set({ "x", "o" }, "ia", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
      end)

      vim.keymap.set({ "n", "x", "o" }, "[f", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
      end)
      vim.keymap.set({ "n", "x", "o" }, "]f", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
      end)

      vim.keymap.set({ "n", "x", "o" }, "[a", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects")
      end)
      vim.keymap.set({ "n", "x", "o" }, "]a", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects")
      end)
    end,
  },
}
