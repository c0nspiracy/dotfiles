return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local mason = require("mason")

    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
    })

    mason_lspconfig.setup({
      -- list of servers for mason to install
      ensure_installed = {
        "bashls",
        "cssls",
        "html",
        "lua_ls",
        "ruby_lsp",
        "vuels",
        "yamlls",
      },

      -- auto-install configured servers (with lspconfig)
      automatic_installation = true,
    })
  end,
}
