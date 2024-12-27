return {
  "saghen/blink.cmp",
  opts = {
    signature = { window = { border = "single" } },
    completion = {
      documentation = { window = { border = "single" } },
      menu = {
        border = "single",
        draw = {
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              -- Optionally, you may also use the highlights from mini.icons
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
        },
      },
    },
    sources = {
      -- add lazydev to your completion providers
      default = { "lazydev" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100, -- show at a higher priority than lsp
          min_keyword_length = 1,
        },
      },
    },
  },
}
