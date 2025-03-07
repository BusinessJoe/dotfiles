return {
    {'nvim-telescope/telescope.nvim', branch = '0.1.x'},
    -- { 'rose-pine/neovim', name = 'rose-pine', init = function()
        --     require('rose-pine').setup({
            --         styles = {
                --             transparency = true
                --         }
                --     })
                --     vim.cmd('colorscheme rose-pine')
                -- end},
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
                {
                    "christoomey/vim-tmux-navigator",
                    cmd = {
                        "TmuxNavigateLeft",
                        "TmuxNavigateDown",
                        "TmuxNavigateUp",
                        "TmuxNavigateRight",
                        "TmuxNavigatePrevious",
                        "TmuxNavigatorProcessList",
                    },
                    keys = {
                        { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
                        { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
                        { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
                        { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
                        { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
                    },
                },
                'mfussenegger/nvim-jdtls',
                { 'lervag/vimtex',
                lazy = false,
            },
            { 'SirVer/ultisnips' },
            { 'rhysd/vim-clang-format' },
            { 'glepnir/galaxyline.nvim', dependencies = {
                'nvim-tree/nvim-web-devicons' -- Icon support
            }},
            -- { 'BusinessJoe/bluemarble.nvim' },
            { dir = '~/code/bluemarble.nvim' },
        }
