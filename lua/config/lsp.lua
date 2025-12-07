-- nvim-cmpでLSP補完を使うためのcapabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

--local lspconfig = require("vim.lsp.config")

-- Mason-LSPconfig自動インストール設定
require("mason-lspconfig").setup({
    ensure_installed = { "pyright", "clangd" },
    automatic_installation = true,
--    handlers = {
--        function(server)
--            config.setup(server, { capabilities =  capabilities })
--        end,
})

-- Python: pyright
vim.lsp.config("pytright", {
    capabilities = capabilities,
})
vim.lsp.enable("pyright")

-- C++: clangd
vim.lsp.config("clangd", {
    capabilities = capabilities,
})
vim.lsp.enable("clangd")
