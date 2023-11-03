return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-web-devicons",
    opts = {
      options = {
        theme = "dracula",
      },
      sections = {
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
        },
      }
    }
  }
}
