local M = {}

M.config = function()
    local spectre = require('spectre')
    spectre.setup({})
    local wk = require('which-key')

    wk.register({
        ['<leader>R'] = { spectre.open, 'Spectre: Replace' },
        ['<leader>r'] = { name = '+replace' },
        ['<leader>rw'] = { function() spectre.open_visual({ select_word = true }) end, 'Spectre: Replace Current Word' },
        ['<leader>rp'] = { function() spectre.open_file_search({ select_word = true }) end,
            'Spectre: Replace Current Word (buffer)' },
    }, {})

    wk.register({
        -- This binds a separate command for visual mode
        ['<leader>rw'] = { '<esc><cmd>lua require("spectre").open_visual()<CR>', 'Spectre: Replace Current Word', mode =
        'v' },
    }, {})
end

return M
