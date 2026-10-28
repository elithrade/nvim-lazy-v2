return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "marilari88/neotest-vitest",
    },
    opts = {
      -- Only parse open test files instead of scanning the whole project in the background.
      discovery = { enabled = false },
      adapters = {
        ["neotest-vitest"] = {},
      },
    },
  },
}
