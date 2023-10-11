local cmp_nvim_lsp = require('cmp_nvim_lsp')
local lspsaga = require('lspsaga')
local lspconfig = require('lspconfig')

local M = {}
M.config = function()
    local capabilities = cmp_nvim_lsp.default_capabilities()
    lspconfig.nixd.setup {
        capabilities = capabilities,
        settings = {
            ['nixd'] = {
                formatting = {
                    command = 'alejandra'
                }
            }
        }
    }
    lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' },
                }
            }
        }
    }
    lspconfig.clojure_lsp.setup {
        capabilities = capabilities,
        init_options = {
            ['semantic-tokens?'] = true
        }
    }

    lspconfig.tsserver.setup {
        capabilities = capabilities,
    }

    lspsaga.setup({
        outline = {
            win_position = 'left',
        },
        lightbulb = {
            virtual_text = false,
            enable_in_insert = true,
        }
    })

    local legendary = require('legendary')
    local telescope_builtin = require('telescope.builtin')
    local wk = require('which-key')

    local format_augroup = vim.api.nvim_create_augroup('LspFormatting', {})

    local on_attach = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        local list_workspace_folders = function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end
        local lsp_format = function()
            vim.lsp.buf.format { async = true }
        end
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = format_augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = format_augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format()
                end,
            })
        end
        local opts = { buffer = bufnr }
        legendary.keymaps({
            { 'gd', vim.lsp.buf.definition, desc = 'LSP: Definition', opts = opts },
            { 'gD', vim.lsp.buf.declaration, desc = 'LSP: Declaration', opts = opts },
            { 'gi', vim.lsp.buf.implementation, desc = 'LSP: Implementation', opts = opts },
            { 'gr', vim.lsp.buf.references, desc = 'LSP: References', opts = opts },
            { 'gt', vim.lsp.buf.type_definition, desc = 'LSP: Type Definition', opts = opts },
            { 'K', ':Lspsaga hover_doc<CR>', desc = 'LSP: Hover', opts = opts },
            { '<C-k>', vim.lsp.buf.signature_help, desc = 'LSP: Signature Help', opts = opts },
            { '<leader>wa', vim.lsp.buf.add_workspace_folder, desc = 'LSP: Add Workspace Folder', opts = opts },
            { '<leader>wr', vim.lsp.buf.remove_workspace_folder, desc = 'LSP: Remove Workspace Folder', opts = opts },
            { '<leader>wl', list_workspace_folders, desc = 'LSP: List Workspace Folders', opts = opts },
            { '<leader>ca', vim.lsp.buf.code_action, desc = 'LSP: Code Actions', opts = opts },
            { '<leader>cci', ':Lspsaga incoming_calls<CR>', desc = 'LSP: Incoming Calls', opts = opts },
            { '<leader>cco', ':Lspsaga outgoing_calls<CR>', desc = 'LSP: Outgoing Calls', opts = opts },
            { '<leader>cd', telescope_builtin.lsp_definitions, desc = 'LSP: List Definitions', opts = opts },
            { '<leader>ce', telescope_builtin.diagnostics, desc = 'LSP: Diagnostics', opts = opts },
            { '<leader>ci', telescope_builtin.lsp_implementations, desc = 'LSP: List Implementation', opts = opts },
            { '<leader>cf', lsp_format, desc = 'LSP: Format', opts = opts },
            { '<leader>co', ':Lspsaga outline<CR>', desc = 'LSP: Outline', opts = opts },
            { '<leader>cr', telescope_builtin.lsp_references, desc = 'LSP: List References', opts = opts },
            { '<leader>cR', vim.lsp.buf.rename, desc = 'LSP: Rename Symbol', opts = opts },
            { '<leader>ct', telescope_builtin.lsp_type_definitions, desc = 'LSP: List Type Definitions', opts = opts },
        })
        local keymaps = {
            ['<leader>w'] = { name = '+window/workspace' },
            ['<leader>c'] = { name = '+code' },
            ['<leader>cc'] = { name = '+calls' },
        }
        wk.register(keymaps, opts)
    end

    local augroup = {
        name = 'UserLspConfig',
        clear = true,
        {
            'LspAttach',
            on_attach
        }
    }

    legendary.autocmd(augroup)
end

return M
