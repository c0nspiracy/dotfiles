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

-- Open explorer on the left-hand side
keymap("n", "<Leader>pv", ":Lex 30<CR>", opts)

keymap("n", "]c", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "[c", ":Gitsigns prev_hunk<CR>", opts)

-- Toggle split/join on a block of code
keymap("n", "<Leader>j", ":TSJToggle<CR>", opts)

keymap("n", "<Leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", opts)

-- The Primeagen
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- keymap("n", "J", "mzJ`z", opts)

keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

keymap("n", "Q", "<nop>", opts)
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)
