return {
  "numToStr/Navigator.nvim",
  config = function()
    local ok_kitty, kitty = pcall(function()
      return require("custom/kitty-navigator"):new()
    end)

    require("Navigator").setup({
      mux = ok_kitty and kitty or "auto",
    })
  end,
}
