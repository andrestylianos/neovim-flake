local M = {}

local autopairs = require('nvim-autopairs')

M.config = function()
    autopairs.setup {}
    autopairs.get_rules("'")[1].not_filetypes = { 'scheme', 'lisp', 'clojure' }
end

return M
