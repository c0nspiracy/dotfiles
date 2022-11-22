local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<Leader>fG", ":Telescope grep_string<CR>", opts)
keymap("n", "<Leader>fb", ":Telescope buffers<CR>", opts)

keymap("n", "]c", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "[c", ":Gitsigns prev_hunk<CR>", opts)
