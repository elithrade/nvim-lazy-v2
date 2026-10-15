return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true

      opts.lsp = opts.lsp or {}
      opts.lsp.signature = { auto_open = { enabled = false } }
    end,
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
