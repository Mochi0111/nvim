local cmp = require("cmp")
local luasnip = require("luasnip")

-- friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(), -- 補完メニューを出す
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enterで確定
        ["<C-]>"] = cmp.mapping.abort(), -- 補完キャンセル 

        -- Tab / S-tab で候補 or スニペットを移動
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s"}),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
        { name = "path" },
    }),
})
