local api = vim.api

api.nvim_create_autocmd("VimEnter", {
  nested = true,
  command = "colorscheme gruvbox"
})
