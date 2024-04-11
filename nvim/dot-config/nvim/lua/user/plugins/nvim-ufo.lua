return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    local ufo = require("ufo")

    -- Using ufo provider for folding requires a larger value than default
    vim.opt.foldlevel = 99 
    vim.opt.foldlevelstart = 99
    vim.opt.foldenable = true

    -- Using ufo provider for folds needs `zR` and `zM` to be remapped.
    vim.keymap.set('n', 'zR', ufo.openAllFolds)
    vim.keymap.set('n', 'zM', ufo.closeAllFolds)

    ufo.setup({
      provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
      end
    })
  end,
}
