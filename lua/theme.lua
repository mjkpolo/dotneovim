vim.cmd("colorscheme gruvbox-material")
vim.g.gruvbox_material_background = 'soft'

require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}

require("lualine").setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox-material',
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
