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
    {
      "<leader>gl",
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        local lazygit = Terminal:new({
          cmd = "lazygit",
          dir = "git_dir",
          direction = "float",
          float_opts = {
            border = "single",
          },
          on_open = function(term)
            vim.cmd("startinsert!")
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
          end,

          -- function to run on closing the terminal
          on_close = function()
            vim.cmd("startinsert!")
            vim.cmd("bufdo e")
          end,
        })

        lazygit:toggle()
      end,
      desc = "Open Lazygit",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = function(event)
        local opts = { buffer = event.buffer }
        -- vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-e>", [[<C-\><C-n>]], opts)
      end,
    })
  end,
}
