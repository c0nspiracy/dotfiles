local lsp = require('lsp-zero')
local neodev = require("neodev")

neodev.setup()

lsp.preset('recommended')

lsp.ensure_installed({
  'bashls',
  'lua_ls',
  'rust_analyzer',
  'tsserver',
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

-- lsp.on_attach(function(_, bufnr)
--   local opts = { buffer = bufnr, remap = false }

--   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--   vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--   vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
-- end)

lsp.nvim_workspace()

lsp.configure('ruby_ls', {})

lsp.skip_server_setup({'standardrb'})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})

local null_ls = require("null-ls")
local h = require("null-ls.helpers")
local null_opts = lsp.build_options("null-ls", {})

local offense_to_diagnostic = function(offense)
  local diagnostic = nil

  diagnostic = {
    message = offense.message,
    ruleId = offense.cop_name,
    level = offense.severity,
    line = offense.location.start_line,
    column = offense.location.start_column,
    endLine = offense.location.last_line,
    endColumn = offense.location.last_column,
  }

  if offense.location.start_line ~= offense.location.last_line then
    diagnostic = vim.tbl_extend("force", diagnostic, { endLine = offense.location.start_line, endColumn = 0 })
  end

  if offense.location.start_column == offense.location.last_column then
    diagnostic = vim.tbl_extend("force", diagnostic, { column = 0, endColumn = 0 })
  end

  return diagnostic
end

local handle_rubocop_output = function(params)
  if params.output and params.output.files then
    local file = params.output.files[1]
    if file and file.offenses then
      local parser = h.diagnostics.from_json({
        severities = {
          info = h.diagnostics.severities.information,
          convention = h.diagnostics.severities.information,
          refactor = h.diagnostics.severities.hint,
          warning = h.diagnostics.severities.warning,
          error = h.diagnostics.severities.error,
          fatal = h.diagnostics.severities.fatal,
        },
        offsets = {
          end_col = 1,
        },
      })
      local offenses = {}

      for _, offense in ipairs(file.offenses) do
        table.insert(offenses, offense_to_diagnostic(offense))
      end

      return parser({ output = offenses })
    end
  end

  return {}
end

null_ls.setup({
  debug = true,
  on_attach = null_opts.on_attach,
  sources = {
    null_ls.builtins.diagnostics.rubocop.with({
      condition = function(_)
        return vim.env.DOCKER_CONTAINER == 'kitman-lde-medinah'
      end,
      command = "docker-rubocop",
      args = { "-f", "json", "--force-exclusion", "--stdin", "$FILENAME" },
      to_stdin = true,
      on_output = handle_rubocop_output,
    })
  }
})
