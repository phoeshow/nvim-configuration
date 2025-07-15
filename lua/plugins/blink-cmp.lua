return {
  "saghen/blink.cmp",
  event = "VimEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "folke/lazydev.nvim",
    "brenoprata10/nvim-highlight-colors",
  },
  version = "1.*",
  opts = {
    keymap = {
      preset = "enter",
      ["<C-space>"] = {},
      ["<C-s>"] = { "show", "show_documentation", "hide_documentation" },
    },
    appearance = {
      nerd_font_variant = "mono",
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
          columns = { { "label" }, { "kind_icon", "kind", gap = 1 }, { "source_name" } },
          components = {
            -- customize source_name
            source_name = {
              text = function(ctx)
                local source = ctx.item.source_name
                if source == "LSP" then
                  source = "󰣖 "
                elseif source == "Path" then
                  source = " "
                elseif source == "Snippets" then
                  source = " "
                elseif source == "Buffer" then
                  source = " "
                elseif source == "Cmdline" then
                  source = " "
                end
                return "[" .. source .. "]"
              end,
            },
            -- customize the drawing of kind icons
            kind_icon = {
              text = function(ctx)
                -- default kind icon
                local icon = ctx.kind_icon
                -- if LSP sources, check for color derived from documentation
                if ctx.item.source_name == "LSP" then
                  local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr ~= "" then
                    icon = color_item.abbr
                  end
                end
                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                -- default highlight group
                local highlight = "BlinkCmpKind" .. ctx.kind
                -- if LSP source, check for color derived from documentation
                if ctx.item.source_name == "LSP" then
                  local color_item = require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr_hl_group then
                    highlight = color_item.abbr_hl_group
                  end
                end
                return highlight
              end,
            },
          },
        },
      },
      accept = { auto_brackets = { enabled = true } },
      documentation = { auto_show = true },
      ghost_text = { enabled = true },
    },
    signature = { enabled = true },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
