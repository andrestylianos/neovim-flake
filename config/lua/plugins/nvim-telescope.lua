local telescope = require("telescope")

local M = {}

M.config = function ()
        telescope.setup({})
        local legendary = require("legendary")
        local telescope_builtin = require("telescope.builtin")
        local wk = require("which-key")

        local keymaps = {
                ["<leader>f"] = { name = "+file/find" },
                ["<leader>g"] = { name = "+git" },
                ["<leader>s"] = { name = "+search" }
        }
        legendary.keymaps({
                { '<leader>fb', telescope_builtin.buffers, desc = 'Find: Buffers' },
                { '<leader>ff', telescope_builtin.find_files, description = 'Find: Files' },
                { '<leader>fF', telescope_builtin.find_files, description = 'Find: Files (cwd)', { cwd = false } },
                { '<leader>fg', telescope_builtin.git_files, description = 'Find: Git Files' },
                { '<leader>fm', telescope_builtin.marks, desc = 'Find: Marks' },

                { '<leader>gb', telescope_builtin.git_branches, desc = 'Git: Branches' },
                { '<leader>gc', telescope_builtin.git_commits, desc = 'Git: Commits' },
                { '<leader>gC', telescope_builtin.git_bcommits, desc = 'Git: Buffer Commits' },
                { '<leader>gs', telescope_builtin.git_status, desc = 'Git: Status' },

                { '<leader>sd', '<cmd>Telescope diagnostics bufnr=0<cr>', desc = 'Search: Diagnostics' },
                { '<leader>sh', telescope_builtin.help_tags, desc = 'Search: Help tags' },
                { '<leader>so', telescope_builtin.vim_options, desc = 'Search: Options' },
                { '<leader>st', telescope_builtin.treesitter, desc = 'Search: Treesitter' },
                { '<leader>s/', telescope_builtin.live_grep, desc = 'Search: Search History' },
                { '<leader>sw', telescope_builtin.grep_string, desc = 'Search: word' , mode = { 'n', 'v' }},

                { '<leader>*', telescope_builtin.grep_string, desc = 'Grep: selection' , mode = { 'n', 'v' }},
                { '<leader>/', telescope_builtin.live_grep, desc = 'Grep: live' },
        })
        wk.register(keymaps, {})


end

return M
