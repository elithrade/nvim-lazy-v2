return {
  -- Roslyn.nvim for C# LSP
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    config = function()
      require("roslyn").setup({
        -- Configuration options go here if needed
      })
      -- Targeted fix for noice.nvim compatibility - only affect Roslyn
      local original_progress_handler = vim.lsp.handlers["$/progress"]
      vim.lsp.handlers["$/progress"] = function(err, result, ctx, config)
        -- Check if this is from Roslyn client
        local client = vim.lsp.get_client_by_id(ctx.client_id)
        if client and client.name == "roslyn" then
          -- Ignore progress notifications from Roslyn to prevent noice.nvim errors
          return
        end
        -- For all other LSP servers, use the original handler
        return original_progress_handler(err, result, ctx, config)
      end
    end,
  },

  -- Disable the default omnisharp LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = false,
      },
    },
  },

  -- Configure conform.nvim for csharpier formatting
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.cs = { "csharpier" }

      opts.formatters = opts.formatters or {}
      opts.formatters.csharpier = {
        command = "csharpier",
        args = { "format", "--write-stdout" },
        stdin = true,
        cwd = require("conform.util").root_file({ ".csproj", ".sln", ".editorconfig" }),
      }

      return opts
    end,
  },

  -- Treesitter configuration for C#
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "c_sharp" })
    end,
  },

  -- Mason configuration for C# tools
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      -- Add custom registries for roslyn
      opts.registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry", -- Required for roslyn
      }

      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "roslyn", -- Roslyn language server
        "netcoredbg", -- C# debugger
      })

      return opts
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nsidorenco/neotest-vstest",
    },
    opts = {
      adapters = {
        ["neotest-vstest"] = {},
      },
    },
  },
}
