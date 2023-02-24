require('dash').setup({
  file_type_keywords = {
    ruby = { 'ruby', 'rubygems' },
  },
})

require('telescope').setup({
  extensions = {
    dash = {
      file_type_keywords = {
        ruby = { 'ruby', 'rubygems' },
      },
    },
  },
})
