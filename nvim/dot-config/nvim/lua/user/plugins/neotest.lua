return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "olimorris/neotest-rspec",
  },
  config = function()
    local neotest = require("neotest")
    local opts = { noremap = true, silent = true }

    neotest.setup({
      adapters = {
        require('neotest-rspec'),
      },
      icons = {
        failed = "✘", -- default 
        passed = "✔", -- default 
      },
      status = {
        -- virtual_text = true,
      },
      quickfix = {
        enabled = true,
        open = false,
      },
    })

    vim.keymap.set('n', '<leader>kn', function() neotest.run.run() end, opts)
    vim.keymap.set('n', '<leader>kf', function() neotest.run.run(vim.fn.expand("%")) end, opts)
    vim.keymap.set('n', '<leader>ka', function() neotest.run.attach() end, opts)

    vim.keymap.set('n', '<leader>ko', function() neotest.output.open() end, opts)
    vim.keymap.set('n', '<leader>kO', function() neotest.output.open({ enter = true }) end, opts)

    vim.keymap.set('n', '<leader>ks', function() neotest.summary.toggle() end, opts)
  end,
}
