local cmp_nvim_lsp = require('cmp_nvim_lsp')

local M = {}
M.config = function()
        local capabilities = cmp_nvim_lsp.default_capabilities()
        require 'lspconfig'.nixd.setup {
                capabilities = capabilities
        }
        require 'lspconfig'.lua_ls.setup {
                capabilities = capabilities
        }
        require 'lspconfig'.clojure_lsp.setup {
                capabilities = capabilities
        }

        local legendary = require("legendary")
        local telescope_builtin = require("telescope.builtin")
        local wk = require("which-key")

        local on_attach = function()
                local keymaps = {
                        ["<leader>c"] = { name = "+code" }
                }
                local list_workspace_folders = function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end
                local lsp_format = function()
                        vim.lsp.buf.format { async = true }
                end
                legendary.keymaps({
                        { 'D',           vim.lsp.buf.type_definition,            desc = 'LSP: Type Definition' },
                        { 'gd',          vim.lsp.buf.definition,                 desc = 'LSP: Definition' },
                        { 'gD',          vim.lsp.buf.declaration,                desc = 'LSP: Declaration' },
                        { 'gi',          vim.lsp.buf.implementation,             desc = 'LSP: Implementation' },
                        { 'gr',          vim.lsp.buf.references,                 desc = 'LSP: References' },
                        { 'K',           vim.lsp.buf.hover,                      desc = 'LSP: Hover' },
                        { '<C-k>',       vim.lsp.buf.signature_help,             desc = 'LSP: Signature Help' },
                        { '<leader>wa',  vim.lsp.buf.add_workspace_folder,       desc = 'LSP: Add Workspace Folder' },
                        { '<leader>wr',  vim.lsp.buf.remove_workspace_folder,    desc = 'LSP: Remove Workspace Folder' },
                        { '<leader>wl',  list_workspace_folders,                 desc = 'LSP: List Workspace Folders' },
                        { '<leader>ca',  vim.lsp.buf.rename,                     desc = 'LSP: Code Actions' },
                        { '<leader>cci', telescope_builtin.lsp_incoming_calls,   desc = 'LSP: Incoming Calls' },
                        { '<leader>cco', telescope_builtin.lsp_outgoing_calls,   desc = 'LSP: Outgoing Calls' },
                        { '<leader>cd',  telescope_builtin.lsp_definitions,      desc = 'LSP: List Definitions' },
                        { '<leader>cD',  telescope_builtin.lsp_references,       desc = 'LSP: List References' },
                        { '<leader>ce',  telescope_builtin.diagnostics,          desc = 'LSP: Diagnostics' },
                        { '<leader>ci',  telescope_builtin.lsp_implementations,  desc = 'LSP: List Implementation' },
                        { '<leader>cf',  lsp_format,                             desc = 'LSP: Format' },
                        { '<leader>cr',  vim.lsp.buf.rename,                     desc = 'LSP: Rename' },
                        { '<leader>ct',  telescope_builtin.lsp_type_definitions, desc = 'LSP: List Type Definitions' },
                })
                wk.register(keymaps, {})
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
