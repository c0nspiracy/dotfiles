-- return {
--   "folke/trouble.nvim",
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   config = function()
--     local trouble = require("trouble")

--     trouble.setup({})
--     vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end)
--     vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end)
--     vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end)
--     vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end)
--     vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end)
--     vim.keymap.set("n", "<leader>xt", function() trouble.toggle("telescope") end)
--     vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end)

--     vim.keymap.set("n", "[t", function() trouble.previous({ skip_groups = true, jump = true }) end)
--     vim.keymap.set("n", "]t", function() trouble.next({ skip_groups = true, jump = true }) end)
--   end,
-- }

return {
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>xX",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>cs",
      "<cmd>Trouble symbols toggle focus=false<cr>",
      desc = "Symbols (Trouble)",
    },
    {
      "<leader>cl",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
    {
      "<leader>xL",
      "<cmd>Trouble loclist toggle<cr>",
      desc = "Location List (Trouble)",
    },
    {
      "<leader>xQ",
      "<cmd>Trouble qflist toggle<cr>",
      desc = "Quickfix List (Trouble)",
    },
  },
}
