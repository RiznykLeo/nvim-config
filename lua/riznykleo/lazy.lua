local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    'nvim-telescope/telescope.nvim', version = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { "rose-pine/neovim", name = "rose-pine" },
  {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

  "ThePrimeagen/harpoon",
  "mbbill/undotree",
  "tpope/vim-fugitive",
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      {'neovim/nvim-lspconfig'},
      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'L3MON4D3/LuaSnip'},
      {"saadparwaiz1/cmp_luasnip"},
      {"rafamadriz/friendly-snippets"},
    }
  },
  "ThePrimeagen/vim-be-good",
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },
  "HiPhish/rainbow-delimiters.nvim",
  "prettier/vim-prettier"
}


local opts = {} 
require("lazy").setup(plugins, opts)
