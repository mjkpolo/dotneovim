local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path })
end

require("packer").init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return require("packer").startup(function(use)
  use 'wbthomason/packer.nvim'
  use "lukas-reineke/indent-blankline.nvim"
  use 'wadackel/vim-dogrun'
  use "nvim-treesitter/nvim-treesitter"
  use {
    "kyazdani42/nvim-tree.lua",
    requires = { "kyazdani42/nvim-web-devicons" },
  }
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }
  use {
    "nvim-telescope/telescope.nvim", branch = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" }
  }
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" }
  }
  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end
  }
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
