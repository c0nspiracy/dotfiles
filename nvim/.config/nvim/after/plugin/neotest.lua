require("neotest").setup({
  adapters = {
    require('neotest-rspec'),
    require('neotest-jest')({
      jestCommand = "yarn jest --"
    }),
  },
})

local api = vim.api

api.nvim_set_keymap('n', '<leader>kn', 'lua require("neotest").run.run()', {})
api.nvim_set_keymap('n', '<leader>kf', 'lua require("neotest").run.run(vim.fn.expand("%"))', {})
api.nvim_set_keymap('n', '<leader>ko', 'lua require("neotest").output.open()', {})
