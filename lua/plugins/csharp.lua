-- ~/.config/nvim/lua/plugins/csharp.lua
return {
  -- Roslyn.nvim for C# LSP
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
      config = {
        -- Fix for noice.nvim compatibility issue
        -- See: https://github.com/seblyng/roslyn.nvim/issues/236
        handlers = {
          ["workspace/_roslyn_projectNeedsRestore"] = function(err, result, ctx, config)
            -- Return success response to satisfy LSP protocol
            return vim.NIL
          end,
        },
      },
    },
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
}
