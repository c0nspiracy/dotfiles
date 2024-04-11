return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local trouble = require("trouble")

    trouble.setup({})
    vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end)
    vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end)
    vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end)
    vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end)
    vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end)
    vim.keymap.set("n", "<leader>xt", function() trouble.toggle("telescope") end)
    vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end)

    vim.keymap.set("n", "[t", function() trouble.previous({ skip_groups = true, jump = true }) end)
    vim.keymap.set("n", "]t", function() trouble.next({ skip_groups = true, jump = true }) end)
  end,
}
