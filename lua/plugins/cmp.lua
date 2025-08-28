return {
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
    dependencies = {
      "saghen/blink.cmp", -- make sure blink is loaded first
    },
    opts = {
      enable_cmp_integration = true, -- enable blink.cmp source
    },
    config = function(_, opts)
      require("emoji").setup(opts)
    end,
  },
}
