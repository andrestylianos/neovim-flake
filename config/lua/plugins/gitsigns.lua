local M = {}

M.config = function()
    local gs = require('gitsigns')
    gs.setup()
    local wk = require('which-key')

    wk.register({
        [']h'] = { gs.next_hunk, 'Next hunk' },
        ['[h'] = { gs.prev_hunk, 'Prev hunk' },
        ['<leader>gh'] = { name = '+hunks' },
        ['<leader>ghb'] = { function() gs.blame_line({ full = true }) end, 'Blame Line' },
        ['<leader>ghd'] = { gs.diffthis, 'Diff this' },
        ['<leader>ghD'] = { function() gs.diffthis('~') end, 'Diff this ~' },
        ['<leader>ghp'] = { gs.preview_hunk, 'Preview hunk' },
        ['<leader>ghr'] = { ':Gitsigns reset_hunk<CR>', 'Reset Hunk', mode = { 'n', 'v' } },
        ['<leader>ghR'] = { gs.reset_buffer, 'Reset Buffer' },
        ['<leader>ghs'] = { ':Gitsigns stage_hunk<CR>', 'Stage Hunk', mode = { 'n', 'v' } },
        ['<leader>ghS'] = { gs.stage_buffer, 'Stage Buffer' },
        ['<leader>ghu'] = { gs.undo_stage_hunk, 'Undo Stage Hunk' },
    }, {})
end

return M
