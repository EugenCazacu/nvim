return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        {
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip", -- for autocompletion
        "rafamadriz/friendly-snippets", -- useful snippets
        "onsails/lspkind.nvim", -- vs-code like pictograms
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local lspkind = require("lspkind")

        -- loads vscode style snippets from installed plugins (e.g. friendly-snipp
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" }, -- snippets
                {
                    name = "buffer", -- text within current buffer
                    -- complete with text from all visible buffers
                    option = {
                        get_bufnrs = function()
                            local bufs = {}
                            for _, win in ipairs(vim.api.nvim_list_wins()) do
                                bufs[vim.api.nvim_win_get_buf(win)] = true
                            end
                            return vim.tbl_keys(bufs)
                        end,
                    },
                },
                { name = "path" }, -- file system paths
            }),
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }), -- next suggestion
                ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                ["<C-d>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(), -- close completion window
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
            }),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            ---@diagnostic disable-next-line: missing-fields
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                    show_labelDetails = true,
                }),
            },
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = { -- configure how nvim-cmp interacts with snippet engine
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
        })

        vim.keymap.set({ "i", "s" }, "<C-j>", function()
            luasnip.jump(1)
        end, { silent = true, desc = "luasnip jump to previous node in snippet" })
        vim.keymap.set({ "i", "s" }, "<C-k>", function()
            luasnip.jump(-1)
        end, { silent = true, desc = "luasnip jump to next node in snippet" })
        vim.keymap.set({ "i", "s" }, "<C-e>", function()
            if luasnip.choice_active() then
                luasnip.change_choice(1)
            end
        end, { silent = true, desc = "luasnip change choice" })
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            souces = { { name = "buffer" } },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                {
                    name = "cmdline",
                    option = {
                        ignore_cmds = { "Man", "!" },
                    },
                },
            }),
        })
    end,
}
