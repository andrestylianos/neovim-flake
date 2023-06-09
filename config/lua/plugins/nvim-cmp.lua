local cmp = require("cmp")

cmp.setup({
  sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      })
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['nixd'].setup {
    capabilities = capabilities
  }
require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities
  }
