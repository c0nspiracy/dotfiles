local vim = vim

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd('packadd packer.nvim')

return require('packer').startup({
  function(use)
    use('wbthomason/packer.nvim')

    -- defaults
    use('tpope/vim-sensible')

    -- colorscheme
    use('gruvbox-community/gruvbox')

    -- status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- lib
    use('nvim-lua/plenary.nvim')
    use('nvim-lua/popup.nvim')

    -- file
    --use('mhinz/vim-startify') -- startup page

    -- lsp
    use('neovim/nvim-lspconfig') -- Collection of configurations for the built-in LSP client

    -- treesitter
    use('nvim-treesitter/nvim-treesitter')
    use('nvim-treesitter/nvim-treesitter-textobjects')

    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    }
    use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
    }

    use {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' }
    }

    use('ggandor/lightspeed.nvim')

    -- testing
    -- use('vim-test/vim-test')
    use {
      'nvim-neotest/neotest',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
        'antoinemadec/FixCursorHold.nvim',
        'olimorris/neotest-rspec',
        'haydenmeade/neotest-jest',
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

    use('andymass/vim-matchup')

    use('tpope/vim-abolish')
    use('tpope/vim-commentary')
    use('tpope/vim-surround')
    use('tpope/vim-rails')
    use('tpope/vim-unimpaired')

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

    use('rlue/vim-fold-rspec')
    use('pedrohdz/vim-yaml-folds')

    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
      require('packer').sync()
    end
  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    },
  },
})
-- vim: ts=2 sts=2 sw=2 et
