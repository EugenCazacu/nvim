return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
        vim.fn["mkdp#util#install"]()
    end,
    config = function()
        local keymap = vim.keymap
        keymap.set("n", "<leader>md", vim.cmd.MarkdownPreviewToggle, { desc = "Start/toggle markdown preview" })
    end,
}
