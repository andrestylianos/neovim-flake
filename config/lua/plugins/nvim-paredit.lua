local M = {}

M.config = function()
    local paredit = require('nvim-paredit')
    local wrap_element_with = function(opening_element, closing_element, placement)
        return function()
            -- place cursor and set mode to `insert`
            paredit.cursor.place_cursor(
            -- wrap element under cursor with `( ` and `)`
                paredit.wrap.wrap_element_under_cursor(opening_element, closing_element),
                -- cursor placement opts
                { placement = placement, mode = 'insert' }
            )
        end
    end
    local wrap_form_with = function(opening_element, closing_element, placement)
        return function()
            -- place cursor and set mode to `insert`
            paredit.cursor.place_cursor(
            -- wrap element under cursor with `( ` and `)`
                paredit.wrap.wrap_enclosing_form_under_cursor(opening_element, closing_element),
                -- cursor placement opts
                { placement = placement, mode = 'insert' }
            )
        end
    end

    local insert_at = function(placement)
        return function()
            local traversal = require('nvim-paredit.utils.traversal')
            local ts = require('nvim-treesitter.ts_utils')
            local langs = require('nvim-paredit.lang')
            local lang = langs.get_language_api()
            local current_form = traversal.find_nearest_form(ts.get_node_at_cursor(), {
                lang = lang,
                use_source = false,
            })
            if not current_form then
                return
            end
            paredit.cursor.place_cursor(
                current_form,
                { placement = placement, mode = 'insert' }
            )
        end
    end

    paredit.setup({
        use_default_keys = true,
        cursor_behaviour = 'auto', -- remain, follow, auto
        keys = {
            ['<localleader>e('] = {
                wrap_element_with('(', ')', 'inner_start'),
                'Wrap element insert head',
            },

            ['<localleader>e)'] = {
                wrap_element_with('(', ')', 'inner_end'),
                'Wrap element insert tail',
            },
            ['<localleader>e['] = {
                wrap_element_with('[', ']', 'inner_start'),
                'Wrap element with [] insert head',
            },

            ['<localleader>e]'] = {
                wrap_element_with('[', ']', 'inner_end'),
                'Wrap element with [] insert tail',
            },
            ['<localleader>e{'] = {
                wrap_element_with('{', '}', 'inner_start'),
                'Wrap element with {} insert head',
            },

            ['<localleader>e}'] = {
                wrap_element_with('{', '}', 'inner_end'),
                'Wrap element with {} insert tail',
            },

            -- same as above but for enclosing form
            ['<localleader>('] = {
                wrap_form_with('(', ')', 'inner_start'),
                'Wrap form insert head',
            },

            ['<localleader>)'] = {
                wrap_form_with('(', ')', 'inner_end'),
                'Wrap form insert tail',
            },
            ['<localleader>['] = {
                wrap_form_with('[', ']', 'inner_start'),
                'Wrap form with [] insert head',
            },

            ['<localleader>]'] = {
                wrap_form_with('[', ']', 'inner_end'),
                'Wrap form with [] insert tail',
            },
            ['<localleader>{'] = {
                wrap_form_with('{', '}', 'inner_start'),
                'Wrap form with {} insert head',
            },

            ['<localleader>}'] = {
                wrap_form_with('{', '}', 'inner_end'),
                'Wrap form with {} insert tail',
            },
            ['<localleader>h'] = {
                insert_at('inner_start'),
                'Wrap form insert head',
            },
            ['<localleader>l'] = {
                insert_at('inner_end'),
                'Wrap form insert head',
            }
        }
    })
end

return M
