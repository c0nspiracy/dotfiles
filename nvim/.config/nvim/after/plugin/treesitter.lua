require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "ruby",
    "html",
    "css",
    "javascript",
    "lua",
    "rust",
  },
  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = { "ruby" }
  },
  matchup = {
    enable = true
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    swap = {
      enable = true,

      swap_next = {
        ["<leader>."] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>,"] = "@parameter.inner",
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
