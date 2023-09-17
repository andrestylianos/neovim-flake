local wk = require('which-key')

local M = {}

M.config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    wk.setup({
        operators = {
            gc = 'Comments',
            ys = 'Surrond add',
        },
    })
end

return M
