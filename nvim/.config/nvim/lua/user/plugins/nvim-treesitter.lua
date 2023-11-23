return {
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/playground",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    vim.opt.foldmethod = expr
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

    require("nvim-treesitter.configs").setup({
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
    })
  end
}
