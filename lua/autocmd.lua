-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Auto switch im-module
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
  group = vim.api.nvim_create_augroup("switch-im", { clear = true }),
  callback = function()
    if vim.fn.has("linux") == 1 and vim.fn.executable("fcitx5-remote") == 1 then
      vim.fn.system("fcitx5-remote -c")
    elseif vim.fn.has("mac") == 1 then
      vim.fn.system("/usr/local/bin/im-select com.apple.keylayout.ABC")
    end
  end,
})

-- close some window with 'q'
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("close_window_with_q", { clear = true }),
  pattern = { "help", "checkhealth", "lspinfo" },
  callback = function()
    vim.keymap.set("n", "q", ":q<cr>")
  end,
})
