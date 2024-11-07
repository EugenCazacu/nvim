return {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
        require("mini.ai").setup()
        -- Alternative to indent-blankline
        -- require("mini.indentscope").setup()
        require("mini.surround").setup()
    end
}
