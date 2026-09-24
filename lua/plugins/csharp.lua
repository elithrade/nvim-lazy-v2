-- The roslyn-language-server apphost resolves .NET via hostfxr, which ignores
-- $PATH/asdf shims and falls back to the system-wide install (e.g. /usr/lib/dotnet).
-- Set DOTNET_ROOT process-wide (scoped to nvim only) so it picks up the
-- asdf-managed .NET 10 runtime regardless of plugin load order.
vim.env.DOTNET_ROOT = vim.fn.expand("~/.asdf/installs/dotnet-core/10.0.400")

return {
  -- Roslyn.nvim for C# LSP
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
      -- Configuration options go here if needed
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
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "roslyn-language-server", -- Roslyn language server (official mason-registry, nuget-based)
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
        -- dap_settings.type must match a registered dap adapter name;
        -- "coreclr" is set up by mason-nvim-dap for the netcoredbg debugger.
        ["neotest-vstest"] = {
          dap_settings = {
            type = "coreclr",
          },
        },
      },
    },
  },

  -- Wire up netcoredbg for C# debugging via nvim-dap
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "netcoredbg" })
      return opts
    end,
  },
}
