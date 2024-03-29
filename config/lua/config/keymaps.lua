local M = {}

local map = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
        opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
end

M.config = function()
    -- better up/down
    map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
    map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

    -- Move to window using the <ctrl> hjkl keys
    --map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window', remap = true })
    --map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window', remap = true })
    --map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window', remap = true })
    --map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window', remap = true })

    -- Resize window using <ctrl> arrow keys
    --map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
    --map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
    --map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
    --map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

    -- Move Lines
    --map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move down' })
    --map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
    --map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move down' })
    --map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move up' })
    --map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
    --map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })

    -- Clear search with <esc>
    map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

    -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
    map('n', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
    map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
    map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
    map('n', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
    map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
    map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

    -- new file
    map('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

    map('n', '<leader>xl', '<cmd>lopen<cr>', { desc = 'Location List' })
    map('n', '<leader>xq', '<cmd>copen<cr>', { desc = 'Quickfix List' })

    -- quit
    map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit all' })

    -- windows
    map('n', '<leader>ww', '<C-W>p', { desc = 'Other window', remap = true })
    map('n', '<leader>wd', '<C-W>c', { desc = 'Delete window', remap = true })
    map('n', '<leader>w-', '<C-W>s', { desc = 'Split window below', remap = true })
    map('n', '<leader>w|', '<C-W>v', { desc = 'Split window right', remap = true })
    --map('n', '<leader>-', '<C-W>s', { desc = 'Split window below', remap = true })
    --map('n', '<leader>|', '<C-W>v', { desc = 'Split window right', remap = true })

    -- tabs
    map('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = 'Last Tab' })
    map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = 'First Tab' })
    map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = 'New Tab' })
    map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
    map('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Close Tab' })
    map('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })
end

return M
