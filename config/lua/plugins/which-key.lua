local wk = require("which-key")

local M = {}

M.config = function ()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    wk.setup()

end

return M
