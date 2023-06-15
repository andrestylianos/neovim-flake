local cmp_nvim_lsp = require('cmp_nvim_lsp')

local M = {}
M.config = function ()
	local capabilities = cmp_nvim_lsp.default_capabilities()
	require'lspconfig'.nixd.setup{
		capabilities = capabilities
	}
	require'lspconfig'.lua_ls.setup{
		capabilities = capabilities
	}
end

return M
