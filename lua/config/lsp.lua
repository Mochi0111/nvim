-- nvim-cmpでLSP補完を使うためのcapabilities
local capabilities = require("cmp_nvim_lsp").default_capabilities()

--local lspconfig = require("vim.lsp.config")

-- Mlson-LSPconfig自動インストール設定
require("mason-lspconfig").setup({
    ensure_installed = { 
        "pyright", 
        "clangd", 
        "dockerls",
        "yamlls",
        "marksman",
    },
    automatic_installation = true,
})


-- 共通設定（全部の LSP に効く）
vim.lsp.config("*", {
    capabilities = capabilities,
})

-- 個別に追加設定したいものがあればここに書く
-- 例: YAML だけ schema 追加したい場合
vim.lsp.config("yamlls", {
    settings = {
        yaml = {
            schemas = {
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                    "docker-compose.yml",
                    "docker-compose.yaml",
                    "compose.yml",
                    "compose.yaml",
                },
            },
        },
    },
})

-- 有効化したい LSP をまとめて enable
vim.lsp.enable({
    "pyright",
    "clangd",
    "dockerls",
    "yamlls",
    "marksman",
})
