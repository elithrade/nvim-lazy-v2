return {
  {
    "hrsh7th/nvim-cmp",
    opts = {
      formatting = {
        format = function(_, item)
          item.menu = ""
          local icons = require("lazyvim.config").icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end,
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      notifier = {
        icons = {
          error = "",
          warn = "",
          info = "",
          debug = "",
          trace = "",
        },
      },
    },
  },
}
