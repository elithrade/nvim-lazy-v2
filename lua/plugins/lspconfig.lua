return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = false, -- Disable tsserver as typescript-tools.nvim is used
        vtsls = false, -- Disable vtsls as typescript-tools.nvim is used
        eslint = false, -- Disable eslint
      },
    },
  },
}