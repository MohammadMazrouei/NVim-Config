-- install lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.mapllocaleader = ' '

-- load plugins
require('lazy').setup({
    { "Mofiqul/dracula.nvim" , name = 'dracula' },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { 'theprimeagen/harpoon'},
    { 'mbbill/undotree' },

    {
        'xeluxee/competitest.nvim',
        dependencies = 'MunifTanjim/nui.nvim',
    },

    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    { 'goolord/alpha-nvim' },

    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
})
