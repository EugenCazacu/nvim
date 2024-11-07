return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "windwp/nvim-ts-autotag" },
    config = function()
        local configs = require("nvim-treesitter.configs")
        ---@diagnostic disable-next-line: missing-fields
        configs.setup({
            ensure_installed = { "c", "bash", "vim", "lua", "html", "vimdoc", "markdown", "gitignore", "cmake" },
            sync_install = false,
            ignore_install = {},
            indent = { enable = true },
            autotag = { enable = true },
            auto_install = true,
            highlight = {
                enable = true,
                -- Disable treesitter for large files
                disable = function(_, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                    return false
                end,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    -- set to `false` to false to disable one of the mappings
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<C-s>",
                    node_decremental = "<C-backspace>",
                },
            },
        })
        vim.keymap.set("n", "<leader>ts", ":lua vim.treesitter.stop()<CR>", { desc = "Stop treesitter." })
    end,
}
