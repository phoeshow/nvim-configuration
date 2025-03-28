return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  opts = {
    keymap = {
      preset = "enter",
      ["<C-space>"] = {},
      ["<C-s>"] = { "show", "show_documentation", "hide_documentation" },
    },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
    completion = {
      menu = {
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
        },
      },
      documentation = {
        auto_show = true,
      },
      ghost_text = {
        enabled = true,
      },
    },
    signature = { enabled = true },
  },
  opts_extend = { "sources.default" },
}
