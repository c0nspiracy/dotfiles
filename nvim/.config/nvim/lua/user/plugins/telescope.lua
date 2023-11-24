return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require('telescope.actions')
      local trouble = require("trouble.providers.telescope")

      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ['<C-j>'] = actions.move_selection_next,
              ['<C-k>'] = actions.move_selection_previous,
              ["<c-t>"] = trouble.open_with_trouble,
            },
            n = {
              ["<c-t>"] = trouble.open_with_trouble
            },
          }
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
          }
        },
        pickers = {
          live_grep = {
            mappings = {
              i = { ["<c-f>"] = actions.to_fuzzy_refine },
            },
          },
        },
      })

      telescope.load_extension('fzf')

      -- Set keymaps
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Fuzzy find files in git repository" })
      vim.keymap.set("n", "<Leader>pf", function() builtin.find_files({ hidden = true }) end, { desc = "Fuzzy find files in cwd" })
      vim.keymap.set("n", "<Leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep through files in cwd" })
      vim.keymap.set("n", "<Leader>fG", ":Telescope grep_string<CR>", { desc = "Live grep for word under cursor in cwd" })
      vim.keymap.set("n", "<Leader>fb", ":Telescope buffers<CR>", { desc = "Fuzzy find over buffers" })
      vim.keymap.set("n", "<Leader>fr", ":Telescope frecency workspace=CWD<CR>", { desc = "Fuzzy find over recently accessed files" })
      -- keymap.set("n", "<Leader>fd", ":Telescope dash search<CR>", opts)
      -- keymap.set("n", "<Leader>fD", ":DashWord<CR>", opts)
   end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end
  }
}
