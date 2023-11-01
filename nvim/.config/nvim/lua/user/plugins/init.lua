return {
  "nvim-lua/plenary.nvim",  -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/popup.nvim",    -- Useful lua functions used by lots of plugins

  "nvim-tree/nvim-web-devicons",

  -- defaults
  "tpope/vim-sensible",

  -- status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-web-devicons"
  },

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional

      -- Null-LS (hooks for non-LSP sources)
      {'jose-elias-alvarez/null-ls.nvim'},
      {'jay-babu/mason-null-ls.nvim'},
    }
  },

  -- treesitter
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-treesitter/playground",

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make"
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- testing
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
      "haydenmeade/neotest-jest",
    }
  },

  -- which-key
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  -- file navigation
  "theprimeagen/harpoon",

  "andymass/vim-matchup",

  "tpope/vim-abolish",
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "tpope/vim-rails",
  "tpope/vim-unimpaired",
  "tpope/vim-fugitive",

  {
    "folke/trouble.nvim",
    dependencies = "nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },

  "rlue/vim-fold-rspec",
  "pedrohdz/vim-yaml-folds",

  "mechatroner/rainbow_csv",

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup()
    end
  },

  -- TreeSJ: split or join blocks of code
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter" },
  },

  -- Highlight CSS colours
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require("nvim-highlight-colors").setup()
    end
  },

  "mbbill/undotree",

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

  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async'
  },

  "folke/neodev.nvim",
}
