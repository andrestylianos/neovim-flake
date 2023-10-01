local treesitter = require('nvim-treesitter.configs')
local M = {}

M.config = function()
    treesitter.setup {
        auto_install = false,
        -- ensure_installed = { 'clojure', 'nix', 'lua', 'graphql' },
        highlight = {
            enable = true,
            -- disable = {},
            --additional_vim_regex_highlighting = {
            --    'clojure',
            --},
        },
        indent = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                },
            },
        },
        rainbow = {
            enable = true,
        },
        playground = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = 'gnn',
                node_incremental = 'grn',
                scope_incremental = 'grc',
                node_decremental = 'grm',
            },
        }
    }
end

return M
