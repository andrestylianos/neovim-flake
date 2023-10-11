local M = {}
local smartsplits = require('smart-splits')

M.config = function()
    smartsplits.setup()
    local wk = require('which-key')

    wk.register({
        ['<A-h>'] = { smartsplits.resize_left, 'Resize window left' },
        ['<A-j>'] = { smartsplits.resize_down, 'Resize window down' },
        ['<A-k>'] = { smartsplits.resize_up, 'Resize window up' },
        ['<A-l>'] = { smartsplits.resize_right, 'Resize window right' },
        ['<C-h>'] = { smartsplits.move_cursor_left, 'Move focus to left window' },
        ['<C-j>'] = { smartsplits.move_cursor_down, 'Move focus to lower window' },
        ['<C-k>'] = { smartsplits.move_cursor_up, 'Move focus to upper window' },
        ['<C-l>'] = { smartsplits.move_cursor_right, 'Move focus to right window' },
        ['<leader>w'] = { name = '+window' },
        ['<leader>wh'] = { smartsplits.swap_buf_left, 'Swap window left' },
        ['<leader>wj'] = { smartsplits.swap_buf_down, 'Swap window down' },
        ['<leader>wk'] = { smartsplits.swap_buf_up, 'Swap window up' },
        ['<leader>wl'] = { smartsplits.swap_buf_right, 'Swap window right' },
    }, {})
end

return M
