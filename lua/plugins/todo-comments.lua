return {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local todo_comments = require("todo-comments")
        -- HACK: kkk
        local keymap = vim.keymap
        keymap.set("n", "]t", function() todo_comments.jump_next() end, { desc = "Next todo comment"})
        -- BUG:
        keymap.set("n", "[t", function() todo_comments.jump_prev() end, { desc = "Previous todo comment"})
        todo_comments.setup()
        -- TODO: 
    end,
}
