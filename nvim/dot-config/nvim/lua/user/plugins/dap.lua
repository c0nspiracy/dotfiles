return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
    "suketa/nvim-dap-ruby"
  },
  config = function()
    require("dapui").setup()
    require("dap-ruby").setup()
  end
}
