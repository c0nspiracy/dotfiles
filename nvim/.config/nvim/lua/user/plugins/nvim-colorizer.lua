-- Highlight CSS colours
return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    filetypes = {
      "javascript",
      css = { css = true },
      html = { names = false },
    },
  },
}
