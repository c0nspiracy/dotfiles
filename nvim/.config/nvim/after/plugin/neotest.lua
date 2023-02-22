local neotest = require("neotest")
local opts = { noremap = true, silent = true }

neotest.setup({
  adapters = {
    require('neotest-rspec')({
      rspec_cmd = "docker-rspec"
    }),
    require('neotest-jest')({
      jestCommand = "yarn jest --"
    }),
  },
})

vim.keymap.set('n', '<leader>kn', function() neotest.run.run() end, opts)
vim.keymap.set('n', '<leader>kf', function() neotest.run.run(vim.fn.expand("%")) end, opts)
vim.keymap.set('n', '<leader>ko', function() neotest.output.open() end, opts)

