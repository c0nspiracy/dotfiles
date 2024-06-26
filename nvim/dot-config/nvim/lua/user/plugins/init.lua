return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000, -- We'd like this plugin to load first out of the rest
    config = true, -- This automatically runs `require("luarocks-nvim").setup()`
  },

  "nvim-lua/plenary.nvim",  -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/popup.nvim",    -- Useful lua functions used by lots of plugins

  "nvim-tree/nvim-web-devicons",

  -- defaults
  "tpope/vim-sensible",

  -- tpope
  "tpope/vim-abolish",
  "tpope/vim-commentary",
  "tpope/vim-obsession",
  "tpope/vim-rails",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",

  -- folding
  "rlue/vim-fold-rspec",
  "pedrohdz/vim-yaml-folds",

  "mechatroner/rainbow_csv",

  -- Fun stuff --
  "eandrju/cellular-automaton.nvim",

  "christoomey/vim-tmux-navigator",
}
