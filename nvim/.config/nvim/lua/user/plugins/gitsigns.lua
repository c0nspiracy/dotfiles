return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {expr=true, desc = 'next hunk'})

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true, desc = 'previous hunk'})

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk, { desc = 'stage hunk' })
      map('n', '<leader>hr', gs.reset_hunk, { desc = 'reset hunk' })
      map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'stage hunk' })
      map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'reset hunk '})
      map('n', '<leader>hS', gs.stage_buffer, { desc = 'stage buffer' })
      map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
      map('n', '<leader>hR', gs.reset_buffer, { desc = 'reset buffer' })
      map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview hunk '})
      map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = 'blame line' })
      map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle blame for current line' })
      map('n', '<leader>hd', gs.diffthis, { desc = 'show diff' })
      map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'show diff ~' })
      map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle deleted' })

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select hunk' })
    end
  }
}
