return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        rust_analyzer = function()
          return true
        end,
      },
      diagnostics = {
        virtual_text = false,
      },
      inlay_hints = { enabled = false },
    },
  },
}
