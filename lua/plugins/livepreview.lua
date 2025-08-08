return {
  "brianhuster/live-preview.nvim",
  enalbed = true,
  dependencies = {
    "folke/snacks.nvim",
  },
  config = function()
    require("livepreview.config").set({
      dynamic_root = true,
    })
  end,
}
