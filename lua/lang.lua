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

require("nvim-tree").setup()

require("nvim-treesitter.configs").setup {
  ensure_installed = { "c", "lua", "cpp", "python" },
  highlight = {
    enable = true,
  },
  autopairs = {
    enable = true,
  },
  indent = {
    enable = true
  },
}

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>d", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end
vim.api.nvim_set_keymap(
  "n",
  "<space>l",
  "<cmd>NvimTreeToggle<cr>",
  opts
)
vim.api.nvim_set_keymap(
  "n",
  "<space>;",
  "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>",
  opts
)
vim.api.nvim_set_keymap(
  "n",
  "<space>'",
  "<cmd>Telescope live_grep<cr>",
  opts
)

require("nvim-lsp-installer").setup {
  ensure_installed = { "ccls", "pylsp", "sumneko_lua" },
  automatic_installation = true,
}

local lspconfig = require("lspconfig")
lspconfig.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
    },
  },
}
lspconfig.ccls.setup { on_attach = on_attach }
lspconfig.pylsp.setup { on_attach = on_attach }
lspconfig.cmake.setup { on_attach = on_attach }
