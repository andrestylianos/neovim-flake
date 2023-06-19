local legendary = require('legendary')
local filters = require('legendary.filters')

local M = {}

M.config = function()
    legendary.setup({ which_key = { auto_register = true } })
    local legendary_find_filtered = function(filter)
        return function()
            legendary.find({ filters = { filter() } })
        end
    end
    legendary.keymaps({
        { '<C-p>', legendary.find, description = 'Legendary', mode = { 'n', 'v' } },
        {
            '<leader>sc',
            legendary_find_filtered(filters.commands),
            description = 'Legendary: Commands',
            mode = { 'n', 'v' }
        },
        { '<leader>sk', legendary_find_filtered(filters.keymaps), description = 'Legendary: Keymaps', mode = { 'n', 'v' } },
        {
            '<leader>sa',
            legendary_find_filtered(filters.autocmds),
            description = 'Legendary: Autocmds',
            mode = { 'n', 'v' }
        },
        { '<leader>sf', legendary_find_filtered(filters.funcs), description = 'Legendary: Functions', mode = { 'n', 'v' } }
    })
end

return M
