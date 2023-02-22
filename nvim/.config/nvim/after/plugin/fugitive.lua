local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>gs", vim.cmd.Git, opts)
