return {
  "stevearc/oil.nvim",
  keys = {
    { "<leader>o", "<cmd>Oil<cr>", desc = "Open Oil File Explorer" },
  },
  lazy = false,
  config = function()
    require("oil").setup({
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<ESC>"] = "actions.close",
        ["q"] = "actions.close",
        ["C-h>"] = false,
        ["M-h"] = "actions.select_split",
      },
    })
  end,
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
