return {
    'nvim-telescope/telescope.nvim',
    { 'rose-pine/neovim', name = 'rose-pine', init = function()
        vim.cmd('colorscheme rose-pine')
    end},
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-treesitter/playground',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    { 'VonHeikemen/lsp-zero.nvim', dependencies = {
        -- LSP Support
        'neovim/nvim-lspconfig',                        -- Required
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim', -- Optional

        -- Autocompletion
        'hrsh7th/nvim-cmp',     -- Required
        'hrsh7th/cmp-nvim-lsp', -- Required
        'L3MON4D3/LuaSnip',     -- Required
    }, opts = function()
        local mason = require("mason")
        mason.setup()
    end, build = ':PylspInstall pylsp-mypy'},
    'sbdchd/neoformat',
    'tpope/vim-obsession',
    'tpope/vim-commentary',
    'christoomey/vim-tmux-navigator',
    'github/copilot.vim',
}
