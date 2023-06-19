local M = {}

M.config = function()
    vim.keymap.set('n', '<leader>R', '<cmd>lua require("spectre").open()<CR>', {
        desc = 'Replace'
    })
    vim.keymap.set('n', '<leader>rw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = 'Replace: Current Word'
    })
    vim.keymap.set('v', '<leader>rw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = 'Replace: Current Word'
    })
    vim.keymap.set('n', '<leader>rp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = 'Replace: Current Word (buffer)'
    })
end

return M
