local M = {}

M.config = function()
    local eval = require('conjure.eval')
    local extract = require('conjure.extract')

    vim.g['conjure#log#wrap'] = true
    vim.g['conjure#client#clojure#nrepl#test#runner'] = 'kaocha'
    -- vim.g['conjure#client#clojure#nrepl#refresh#before'] = 'mount.core/stop'
    -- vim.g['conjure#client#clojure#nrepl#refresh#after'] = 'mount.core/start'
    vim.g['conjure#client#clojure#nrepl#refresh#dirs'] = { 'src', 'test' }

    local function conjure_eval(form)
        return eval['eval-str']({ code = form, origin = 'custom_command' })
    end

    local function conjure_eval_fn(form)
        return function()
            return conjure_eval(form)
        end
    end

    local function save_and_conjure_eval_fn(form)
        return function()
            vim.cmd.write({})
            return conjure_eval(form)
        end
    end

    local function conjure_word()
        return extract.word().content
    end

    local function conjure_form(is_root)
        return (extract.form({ ['root?'] = is_root })).content
    end

    local function tap_word()
        local word = conjure_word()
        return conjure_eval(('(tap> ' .. word .. ')'))
    end

    local function tap_form()
        local form = conjure_form(false)
        return conjure_eval(('(tap> ' .. form .. ')'))
    end

    local function tap_root_form()
        local form = conjure_form(true)
        return conjure_eval(('(tap> ' .. form .. ')'))
    end

    local portal_cmds = {
        open = conjure_eval_fn([[
    (do (ns dev)
        ((requiring-resolve 'portal.api/close))
        (def portal ((requiring-resolve 'portal.api/open)
                     {:theme :portal.colors/nord}))
        (add-tap (requiring-resolve 'portal.api/submit)))
  ]]),
        clear = conjure_eval_fn('[[(portal.api/clear)]]'),
        last_exception = conjure_eval_fn('[[(tap> (Throwable->map *e))]]'),
        tap_word = tap_word,
        tap_form = tap_form,
        tap_root_form = tap_root_form,
    }

    local wk = require('which-key')
    local legendary = require('legendary')

    local add_keymaps = function(args)
        local opts = { buffer = args.buf }
        legendary.keymaps({
            { '<localleader>po', portal_cmds.open, desc = 'Portal: Open', opts = opts },
            { '<localleader>px', portal_cmds.last_exception, desc = 'Portal: Tap last exception', opts = opts },
            { '<localleader>pw', portal_cmds.tap_word, desc = 'Portal: Tap word', opts = opts },
            { '<localleader>pe', portal_cmds.tap_form, desc = 'Portal: Tap form', opts = opts },
            { '<localleader>pf', portal_cmds.tap_form, desc = 'Portal: Tap form', opts = opts },
            { '<localleader>pr', portal_cmds.tap_root_form, desc = 'Portal: Tap root form', opts = opts },
        })
        wk.register({
            p = {
                name = 'portal',
                cond = vim.bo.filetype == 'clojure',
            },
        }, {
            prefix = '<localleader>',
            buffer = args.buf
        })
    end
    local augroup = {
        name = 'ConjureConfig',
        clear = true,
        {
            'FileType',
            add_keymaps,
            opts = {
                pattern = { 'clojure', 'lua' }
            }
        }
    }

    legendary.autocmd(augroup)
end

return M
