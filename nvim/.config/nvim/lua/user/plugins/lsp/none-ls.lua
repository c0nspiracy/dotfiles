return {
  "nvimtools/none-ls.nvim", -- configure formatters & linters
  lazy = true,
  event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
  dependencies = {
    "jay-babu/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.shfmt,
      },
    })
  end,
}
