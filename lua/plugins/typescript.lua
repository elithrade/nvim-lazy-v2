return {
  {
    "neovim/nvim-lspconfig",
    ---@class LspInitOptions
    opts = function(plugin, opts)
      local util = require("lspconfig.util")

      -- define your custom servers
      local my_servers = {
        vtsls = {
          root_dir = util.root_pattern("tsconfig.json", "jsconfig.json", "package.json", ".git"),
          init_options = {
            maxTsServerMemory = 4096,
          },
          on_attach = function(client, bufnr)
            -- We need to make sure the results of this are handled asynchronously
            -- so that we don't block the UI
            vim.keymap.set("n", "<leader>co", function()
              vim.lsp.buf.rename()
            end, { buffer = bufnr, desc = "Rename" })
          end,
        },
        eslint = {
          root_dir = util.root_pattern("eslint.config.js", ".eslintrc.json", ".eslintrc.js", "package.json", ".git"),
          init_options = {
            -- Add any eslint-specific init options here
          },
          on_attach = function(client, bufnr)
            -- We need to make sure the results of this are handled asynchronously
            -- so that we don't block the UI
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = true })
              end,
            })
          end,
        },
      }

      -- merge the servers returned by the function with the default servers
      vim.tbl_deep_extend("force", opts.servers, my_servers)
    end,
  },
}
