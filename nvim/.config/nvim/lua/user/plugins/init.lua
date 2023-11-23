return {
  "nvim-lua/plenary.nvim",  -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/popup.nvim",    -- Useful lua functions used by lots of plugins

  "nvim-tree/nvim-web-devicons",

  -- defaults
  "tpope/vim-sensible",

  -- file navigation
  "theprimeagen/harpoon",

  "andymass/vim-matchup",

  "tpope/vim-abolish",
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "tpope/vim-rails",
  "tpope/vim-unimpaired",
  "tpope/vim-fugitive",

  "rlue/vim-fold-rspec",
  "pedrohdz/vim-yaml-folds",

  "mechatroner/rainbow_csv",

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end
  },

  -- Highlight CSS colours
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup()
    end
  },

  -- Fun stuff --
  -- A useless plugin that might help you cope with stubbornly broken tests or
  -- overall lack of sense in life
  "eandrju/cellular-automaton.nvim",

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      -- configurations go here
    },
  },

  {
    'mrjones2014/dash.nvim',
    build = 'make install',
  },

  "christoomey/vim-tmux-navigator",

  "folke/neodev.nvim",
}
