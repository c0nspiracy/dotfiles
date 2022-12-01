local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   "n" - normal_mode
--   "i" - insert mode
--   "v" - visual mode
--   "x" - visual block mode
--   "t" - term mode
--   "c" - command mode

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Open explorer on the left-hand side
keymap("n", "<Leader>e", ":Lex 30<CR>", opts)

keymap("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<Leader>fG", ":Telescope grep_string<CR>", opts)
keymap("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<Leader>fr", ":Telescope frecency workspace=CWD<CR>", opts)

keymap("n", "]c", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "[c", ":Gitsigns prev_hunk<CR>", opts)

-- Toggle split/join on a block of code
keymap("n", "<Leader>j", ":TSJToggle<CR>", opts)
