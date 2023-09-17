local M = {}
local edgy = require('edgy')
local conjure_log = require('conjure.log')

M.config = function()
    edgy.setup({
        exit_when_last = true,
        options = {
            right = { size = 70 },
        },
        animate = {
            enabled = false
        },
        bottom = {
            {
                ft = 'noice',
                size = { height = 0.4 },
                filter = function(buf, win)
                    return vim.api.nvim_win_get_config(win).relative == ''
                end,
            },
            'Trouble',
            { ft = 'qf', title = 'QuickFix' },
            {
                ft = 'help',
                size = { height = 20 },
                -- only show help buffers
                filter = function(buf)
                    return vim.bo[buf].buftype == 'help'
                end,
            },
            { ft = 'spectre_panel', size = { height = 0.4 } },
        },
        right = {
            {
                ft = 'clojure',
                title = 'REPL',
                filter = function(buf)
                    return conjure_log['log-buf?'](vim.api.nvim_buf_get_name(buf))
                end,
            },
        },
        left = {
            {
                title = 'Outline',
                ft = 'sagaoutline',
                pinned = true,
                open = 'Lspsaga outline',
            }
        }
        ,
        -- enable this on Neovim <= 0.10.0 to properly fold edgebar windows.
        -- Not needed on a nightly build >= June 5, 2023.
        fix_win_height = vim.fn.has('nvim-0.10.0') == 0,
    })
end

return M
