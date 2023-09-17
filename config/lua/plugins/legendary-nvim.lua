local legendary = require('legendary')
local filters = require('legendary.filters')

local M = {}

M.config = function()
    legendary.setup({
        which_key = {
            auto_register = true,
            do_binding = false,
            use_groups = false,
        }
    })
    local legendary_find_filtered = function(filter)
        return function()
            legendary.find({ filters = { filter() } })
        end
    end
    legendary.keymaps({
        { '<C-p>', legendary.find, description = 'Legendary', mode = { 'n', 'v' } },
        { '<leader>sf', legendary_find_filtered(filters.funcs), description = 'Legendary: Functions', mode = { 'n', 'v' } }
    })
end

return M
