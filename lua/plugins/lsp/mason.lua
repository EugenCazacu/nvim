return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")
        mason.setup({})
        mason_lspconfig.setup({
            ensure_installed = {
                "bashls",
                "cmake",
                "clangd",
                "lua_ls",
                "html",
                "pyright",
            },
        })
        mason_tool_installer.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "clang-format",
                "isort",
                "black",
                "pylint",
                "markdownlint",
                "cmakelint",
            },
        })
    end,
}
