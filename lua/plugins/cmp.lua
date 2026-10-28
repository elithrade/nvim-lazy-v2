return {
  -- Disable the community snippet collection so only LSP/path/buffer
  -- completions are suggested (no more unwanted snippet popups like method_async).
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "allaman/emoji.nvim", "saghen/blink.compat" },
    opts = {
      sources = {
        default = { "emoji" },
        providers = {
          emoji = {
            name = "emoji",
            module = "blink.compat.source",
            -- overwrite kind of suggestion
            transform_items = function(ctx, items)
              local kind = require("blink.cmp.types").CompletionItemKind.Text
              for i = 1, #items do
                items[i].kind = kind
              end
              return items
            end,
          },
        },
      },
    },
  },
  {
    "allaman/emoji.nvim",
    version = "1.0.0",
    -- Loaded by blink.cmp as a dependency
    lazy = true,
    opts = {
      enable_cmp_integration = true, -- enable blink.cmp source
    },
  },
}
