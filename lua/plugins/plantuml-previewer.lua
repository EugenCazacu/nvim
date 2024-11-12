return {
    "weirongxu/plantuml-previewer.vim",
    dependencies = {
        "tyru/open-browser.vim",
        "aklt/plantuml-syntax",
    },
    config = function()
        local keymap = vim.keymap

        keymap.set("n", "<leader>ps", vim.cmd.PlantumlStart, { desc = "Start following plantuml in current buffer" })
        keymap.set(
            "n",
            "<leader>po",
            vim.cmd.PlantumlOpen,
            { desc = "Open plantuml previewer in browser and watch current buffer" }
        )
        keymap.set("n", "<leader>pt", vim.cmd.PlantumlToggle, { desc = "Toggle PlantumlStart PlantumlStop" })
    end,
}
