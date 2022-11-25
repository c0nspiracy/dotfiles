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
  -- have packer manage itself
  use("wbthomason/packer.nvim")

  -- defaults
  use("tpope/vim-sensible")

  -- colorscheme
  use("gruvbox-community/gruvbox")

  -- status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  -- lib
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")

  -- lsp
  use("neovim/nvim-lspconfig") -- Collection of configurations for the built-in LSP client

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
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" }
  }

  use("ggandor/lightspeed.nvim")

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

  use("andymass/vim-matchup")

  use("tpope/vim-abolish")
  use("tpope/vim-commentary")
  use("tpope/vim-surround")
  use("tpope/vim-rails")
  use("tpope/vim-unimpaired")

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
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

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
-- vim: ts=2 sts=2 sw=2 et
