return {
  {
    "neovim/nvim-lspconfig",
    ---@class LspInitOptions
    opts = {
      ---@diagnostic disable-next-line:missing-fields
      servers = {
        vtsls = {
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
      },
    },
  },
}
