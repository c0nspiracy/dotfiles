local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'bashls',
  'lua_ls',
  'rust_analyzer',
  'yamlls',
})

local cmp = require('cmp')
local cmp_select = { behaviour = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
end)

lsp.nvim_workspace()

lsp.setup()

local null_ls = require("null-ls")
local h = require("null-ls.helpers")
local null_opts = lsp.build_options("null-ls", {})

null_ls.setup({
  debug = true,
  on_attach = null_opts.on_attach,
  sources = {
    null_ls.builtins.diagnostics.rubocop.with({
      command = "docker-rubocop",
      args = { "-f", "json", "--force-exclusion", "--stdin", "$FILENAME" },
      to_stdin = true,
    })
  }
})
