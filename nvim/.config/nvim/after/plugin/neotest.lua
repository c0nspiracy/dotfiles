local opts = { noremap = true, silent = true }

require("neotest").setup({
  adapters = {
    require('neotest-rspec'),
    require('neotest-jest')({
      jestCommand = "yarn jest --"
    }),
  },
})

vim.keymap.set('n', '<leader>kn', function() neotest.run.run() end, opts)
vim.keymap.set('n', '<leader>kf', function() neotest.run.run(vim.fn.expand("%")) end, opts)
vim.keymap.set('n', '<leader>ko', function() neotest.output.open() end, opts)

