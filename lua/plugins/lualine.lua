return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        component_separators = "|",
        section_separators = "",
      },
      sections = {
        lualine_a = {
          {
            "mode",
            -- Just take first character of mode
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
      },
    },
  },
}
