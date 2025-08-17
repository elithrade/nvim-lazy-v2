return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    picker = {
      layout = {
        preset = "vertical",
        -- layout = {
        --   height = 0.8,
        --   width = 120,
        -- },
      },
    },
    styles = {
      notification = {
        wo = { wrap = true },
      },
    },
  },
  keys = {
    {
      "<localleader>p",
      function()
        Snacks.picker.files({
          cwd = require("lazy.core.config").options.root,
        })
      end,
      desc = "Find [P]lugin File",
    },
    {
      "<localleader>f",
      function()
        Snacks.picker.files({
          -- Snacks picker respects .gitignore by default
          -- hidden files are not shown by default (similar to your telescope config)
        })
      end,
      desc = "Lists [f]iles in your current working directory, respects .gitignore",
    },
    {
      "<localleader>r",
      function()
        Snacks.picker.grep({
          -- Snacks picker includes hidden files in grep by default
        })
      end,
      desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
    },
    {
      "<localleader><localleader>",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Lists open buffers",
    },
    {
      "<localleader>t",
      function()
        Snacks.picker.help()
      end,
      desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
    },
    {
      "<localleader>;",
      function()
        Snacks.picker.resume()
      end,
      desc = "Resume the previous snacks picker",
    },
    {
      "<localleader>e",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Lists Diagnostics for all open buffers or a specific buffer",
    },
    {
      "<localleader>s",
      function()
        -- Snacks doesn't have a direct treesitter equivalent, using LSP symbols instead
        -- This provides similar functionality for navigating functions/variables
        Snacks.picker.lsp_symbols()
      end,
      desc = "Lists Function names, variables from LSP symbols",
    },
    {
      "<leader>e",
      function()
        Snacks.picker.explorer({
          cwd = vim.fn.expand("%:p:h"),
          auto_close = true,
          layout = {
            preset = "vertical",
            preview = false,
            -- layout = {
            --   height = 0.6,
            --   width = 60,
            -- },
          },
        })
      end,
      desc = "Open File Browser with the path of the current buffer",
    },
  },
}
