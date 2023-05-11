local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer. Please close and re-open Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins here
return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Have packer manage itself
  use("nvim-lua/plenary.nvim")  -- An implementation of the Popup API from vim in Neovim
  use("nvim-lua/popup.nvim")    -- Useful lua functions used by lots of plugins

  use("nvim-tree/nvim-web-devicons")

  -- defaults
  use("tpope/vim-sensible")

  -- colorscheme
  use("dracula/vim")

  -- status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = "nvim-web-devicons"
  }

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
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
  }

  -- treesitter
  use("nvim-treesitter/nvim-treesitter")
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("nvim-treesitter/playground")

  use {
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }
  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make"
  }
  use {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end,
    requires = {"kkharji/sqlite.lua"}
  }

  use {
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }

  -- testing
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "olimorris/neotest-rspec",
      "haydenmeade/neotest-jest",
    }
  }

  -- which-key
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  -- file navigation
  use("theprimeagen/harpoon")

  use("andymass/vim-matchup")

  use("tpope/vim-abolish")
  use("tpope/vim-commentary")
  use("tpope/vim-surround")
  use("tpope/vim-rails")
  use("tpope/vim-unimpaired")
  use("tpope/vim-fugitive")

  use {
    "folke/trouble.nvim",
    requires = "nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use("rlue/vim-fold-rspec")
  use("pedrohdz/vim-yaml-folds")

  use("mechatroner/rainbow_csv")

  use {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        use_treesitter = true,
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = true,
      }
    end
  }

  -- TreeSJ: split or join blocks of code
  use({
    "Wansmer/treesj",
    requires = { "nvim-treesitter" },
  })

  -- Highlight CSS colours
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  }

  use("mbbill/undotree")

  -- Fun stuff --
  -- A useless plugin that might help you cope with stubbornly broken tests or
  -- overall lack of sense in life
  use "eandrju/cellular-automaton.nvim"

  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  })

  use({
    'mrjones2014/dash.nvim',
    run = 'make install',
  })

  use "christoomey/vim-tmux-navigator"

  use {
    'kevinhwang91/nvim-ufo',
    requires = 'kevinhwang91/promise-async'
  }

  use "folke/neodev.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
-- vim: ts=2 sts=2 sw=2 et
