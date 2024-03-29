local M = {}

local autopairs = require('nvim-autopairs')

M.config = function()
    autopairs.setup({
        enable_check_bracket_line = false,
        ignored_next_char = [=[[%'%"%$]]=]
    })
    autopairs.get_rules("'")[1].not_filetypes = { 'scheme', 'lisp', 'clojure' }
end

return M
