-- TODO: Note that this plugin is no longer maintained
return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    -- build = function()
    --     vim.fn["mkdp#util#install"]()
    -- end,
    build = ":call mkdp#util#install()",
    -- or if not working:
    -- cd ~/.local/share/nvim/lazy/markdown-preview.nvim
    -- npm install
    config = function()
        local keymap = vim.keymap
        keymap.set("n", "<leader>md", vim.cmd.MarkdownPreviewToggle, { desc = "Start/toggle markdown preview" })
    end,
}
