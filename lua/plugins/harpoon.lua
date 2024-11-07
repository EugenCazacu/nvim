return {
    "ThePrimeagen/harpoon",
    config = function ()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")
        local term = require("harpoon.term")
        local termUi = require("harpoon.cmd-ui")
        local keymap = vim.keymap
        keymap.set("n", "<leader>a", mark.add_file, {desc = "Add file to harpoon"})
        keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc = "Show harpoon menu"})
        keymap.set("n", "<leader>e", termUi.toggle_quick_menu, {desc = "Show term harpoon menu"})
        keymap.set("n", "<leader>1", function () ui.nav_file(1) end, {desc = "1st harpoon file"})
        keymap.set("n", "<leader>2", function () ui.nav_file(2) end, {desc = "2nd harpoon file"})
        keymap.set("n", "<leader>3", function () ui.nav_file(3) end, {desc = "3rd harpoon file"})
        keymap.set("n", "<leader>4", function () ui.nav_file(4) end, {desc = "4th harpoon file"})
        keymap.set("n", "<leader>5", function () ui.nav_file(5) end, {desc = "5th harpoon file"})
        keymap.set("n", "<leader>t1", function () term.gotoTerminal(1) end, {desc = "1st harpoon terminal"})
        keymap.set("n", "<leader>t2", function () term.gotoTerminal(2) end, {desc = "2nd harpoon terminal"})
        keymap.set("n", "<leader>t3", function () term.gotoTerminal(3) end, {desc = "3rd harpoon terminal"})
        keymap.set("n", "<leader>t4", function () term.gotoTerminal(4) end, {desc = "4th harpoon terminal"})
        keymap.set("n", "<leader>t5", function () term.gotoTerminal(5) end, {desc = "5th harpoon terminal"})
        require("harpoon").setup {
            -- projects = {
            --     ["$SOME_REPO"] = {
            --         term = {
            --             cmds = {
            --                 "CMD1",
            --                 "CMD2",
            --             }
            --         },
            --     },
            -- },
            global_settings = {
                enter_on_sendcmd = true
            }
        }
    end
}
