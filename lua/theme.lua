vim.cmd("colorscheme dogrun")

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
  }
}

require("telescope").setup {
  defaults = {
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },
  },
  pickers = {
    live_grep = {
      theme = "dropdown",
    }
  },
}
