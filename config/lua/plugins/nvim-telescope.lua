local telescope = require('telescope')

local M = {}

M.config = function()
    local noice = require('noice')
    telescope.setup({})
    telescope.load_extension('fzf')
    telescope.load_extension('noice')
    telescope.load_extension('notify')
    local telescope_builtin = require('telescope.builtin')
    local todo_comments = require('todo-comments')
    local wk = require('which-key')

    todo_comments.setup({})
    wk.register({
        ['<leader>f'] = { name = '+file/find' },
        ['<leader>g'] = { name = '+git' },
        ['<leader>s'] = { name = '+search' },
        ['<leader>sn'] = { name = '+notifications' },
        -- TODO move this somewhere else
        ['<C-c>'] = { ':Bdelete <CR>', 'Buffer delete' },
        ['<C-d>'] = { ':Bwipeout <CR>', 'Buffer wipeout' },
        ['<leader>fb'] = { telescope_builtin.buffers, 'Find: Buffers' },
        ['<leader>ff'] = { telescope_builtin.find_files, 'Find: Files' },
        ['<leader>fF'] = { function() telescope_builtin.find_files({ cwd = false }) end, 'Find: Files (cwd)' },
        ['<leader>fg'] = { telescope_builtin.git_files, 'Find: Git Files' },
        ['<leader>fm'] = { telescope_builtin.marks, 'Find: Marks' },
        ['<leader><leader>'] = { telescope_builtin.marks, 'Find: Marks' },
        ['<leader>gb'] = { telescope_builtin.git_branches, 'Git: Branches' },
        ['<leader>gc'] = { telescope_builtin.git_commits, 'Git: Commits' },
        ['<leader>gC'] = { telescope_builtin.git_bcommits, 'Git: Buffer Commits' },
        ['<leader>gs'] = { telescope_builtin.git_status, 'Git: Status' },
        ['<leader>s:'] = { '<cmd>Telescope command_history<cr>', 'Command history' },
        ['<leader>s"'] = { '<cmd>Telescope registers<cr>', 'Registers' },
        ['<leader>sa'] = { '<cmd>Telescope autocommands<cr>', 'Auto Commands' },
        ['<leader>sc'] = { '<cmd>Telescope commands<cr>', 'Commands' },
        ['<leader>sh'] = { telescope_builtin.help_tags, 'Search: Help tags' },
        ['<leader>sH'] = { '<cmd>Telescope highlights<cr>', desc = 'Search Highlight Groups' },
        ['<leader>sk'] = { '<cmd>Telescope keymaps<cr>', 'Key Maps' },
        ['<leader>sM'] = { '<cmd>Telescope man_pages<cr>', 'Man Pages' },
        ['<leader>sm'] = { '<cmd>Telescope marks<cr>', 'Jump to Mark' },
        ['<leader>sna'] = { function() noice.cmd('all') end, 'Notifications: all' },
        ['<leader>snd'] = { function() noice.cmd('dismiss') end, 'Notifications: dismiss' },
        ['<leader>snh'] = { telescope.extensions.noice.noice, 'Notifications: history' },
        ['<leader>snl'] = { function() noice.cmd('last') end, 'Notifications: last' },
        ['<leader>snn'] = { telescope.extensions.notify.notify, 'Notifications: notifications' },
        ['<leader>so'] = { telescope_builtin.vim_options, 'Search: Options' },
        ['<leader>sr'] = { '<cmd>Telescope resume<cr>', desc = 'Resume' },
        ['[t'] = { function() todo_comments.jump_next() end, 'Next todo comment' },
        [']t'] = { function() todo_comments.jump_prev() end, 'Prev todo comment' },
        ['<leader>st'] = { '<cmd>TodoTelescope<cr>', 'Search: Todo' },
        ['<leader>sx'] = { '<cmd>Telescope diagnostics bufnr=0<cr>', 'Search: Diagnostics' },
        ['<leader>sX'] = { '<cmd>Telescope diagnostics<cr>', 'Workspace diagnostics' },
        ['<leader>s/'] = { telescope_builtin.search_history, 'Search: Search History' },
        ['<leader>sw'] = { telescope_builtin.grep_string, 'Search: word', mode = { 'n', 'v' } },
        ['<leader>*'] = { telescope_builtin.grep_string, 'Grep: selection', mode = { 'n', 'v' } },
        ['<leader>/'] = { telescope_builtin.live_grep, 'Grep: live' },
    }, {})
end

return M
