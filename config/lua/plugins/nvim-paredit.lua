local M = {}

local treesitter_sexp = require('treesitter-sexp')

M.config = function()
    treesitter_sexp.setup({})
end

return M
