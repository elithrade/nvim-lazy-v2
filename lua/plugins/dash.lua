local sections = {
  { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
  { icon = " ", title = "Recent Files", cwd = true, section = "recent_files", indent = 2, padding = 1 },
  { section = "startup" },
}

-- Only show the wallpaper header when chafa is available
if vim.fn.executable("chafa") == 1 then
  local wall = vim.fn.stdpath("config") .. "/walls/flower.jpg"
  table.insert(sections, 1, {
    section = "terminal",
    cmd = "chafa " .. vim.fn.shellescape(wall) .. " --format symbols --symbols vhalf --size 60x15 --stretch; sleep .1",
    height = 15,
    padding = 1,
  })
end

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = sections,
    },
  },
}
