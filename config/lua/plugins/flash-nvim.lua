local flash = require('flash')

local M = {}

M.config = function()
    local legendary = require('legendary')
    local wk = require('which-key')

    legendary.keymaps({
        { 's', function() flash.jump() end, desc = 'Flash', mode = { 'n', 'x', 'o' } },
        { 'S', function() flash.treesitter() end, desc = 'Flash Treesitter', mode = { 'n', 'x', 'o' } },
        { 'r', function() flash.remote() end, desc = 'Flash Remote', mode = { 'o' } },
        { 'R', function() flash.treesitter_search() end, desc = 'Flash Treesitter Search', mode = { 'x', 'o' } },
    })
    wk.register(keymaps, {})
end

return M
