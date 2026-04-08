return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", config = true },
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.INFO] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
        },
      },
    })

    -- configure html server
    vim.lsp.config('html', {
      capabilities = capabilities,
      on_attach = on_attach,
    })
    vim.lsp.enable('html')

    -- configure css server
    vim.lsp.config('cssls', {
      capabilities = capabilities,
      on_attach = on_attach,
    })
    vim.lsp.enable('cssls')

    -- configure lua server (with special settings)
    -- lspconfig.lua_ls.setup({
    vim.lsp.config('lua_ls', {
      -- capabilities = capabilities,
      -- on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          runtime = {
            version = "LuaJIT", -- LuaJIT in the case of neovim
            path = vim.split(package.path, ";"),
          },
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = {
              "vim",
              "require"
            },
          },
          workspace = {
            -- make language server aware of runtime files
            library = vim.api.nvim_get_runtime_file("", true),
            -- library = {
            --   [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            --   [vim.fn.stdpath("config") .. "/lua"] = true,
            -- },
          },
        },
      },
    })
    vim.lsp.enable('lua_ls')

    -- configure ruby server
    -- vim.lsp.config('ruby_lsp', {
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   cmd = { "bundle", "exec", "ruby-lsp" },
    --   root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
    -- })
    vim.lsp.enable('ruby_lsp')

    vim.lsp.enable('jsonls')

    -- configure ruby linter
    -- lspconfig["standardrb"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach,
    --   cmd = { "bundle", "exec", "standardrb", "--lsp" },
    --   root_dir = lspconfig.util.root_pattern("Gemfile", ".git", "."),
    -- })

    lspconfig["bashls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["yamlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
