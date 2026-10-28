return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
      "nsidorenco/neotest-vstest",
    },
    opts = {
      -- Only parse open test files instead of scanning the whole project in the background.
      discovery = { enabled = false },
      adapters = {
        ["neotest-vitest"] = {},
        -- Only look for a .sln/.slnx upward from the opened folder, never recursively through it.
        ["neotest-vstest"] = { broad_recursive_discovery = false },
      },
    },
  },
}
