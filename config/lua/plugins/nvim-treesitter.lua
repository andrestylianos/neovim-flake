local treesitter = require('treesitter')
local M = {}

M.config = function()
        treesitter.setup {
                ensure_installed = { 'clojure', 'nix', 'lua' },
                highlight = {
                        additional_vim_regex_highlighting = {
                                "clojure",
                        },
                },
                textobjects = {
                        select = {
                                enable = true,
                                lookahead = true,
                                keymaps = {
                                        ["af"] = "@function.outer",
                                        ["if"] = "@function.inner",
                                },
                        },
                },
                rainbow = {
                        enable = true,
                },
                playground = {
                        enable = true,
                }
        }
end

return M
