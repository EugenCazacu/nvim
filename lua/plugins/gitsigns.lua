return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        current_line_blame = true,
        linehl = true,
        word_diff = true,
        numhl = true,
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end
            map("n", "]c", function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return "<Ignore>"
            end, { expr = true, desc = "Next Hunk/Change" })

            map("n", "[c", function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return "<Ignore>"
            end, { expr = true, desc = "Previous Hunk/Change" })

            map("n", "<leader>hs", gs.stage_hunk, { desc = "gitsigns stage hunk" })
            map("n", "<leader>hr", gs.reset_hunk, { desc = "gitsigns reset hunk" })
            map("v", "<leader>hs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { desc = "gitsigns stage hunk" })
            map("v", "<leader>hr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, { desc = "gitsigns reset hunk" })
            map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "gitsigns undo stage hunk" })
            map("n", "<leader>hS", gs.stage_buffer, { desc = "gitsigns stage buffer" })
            map("n", "<leader>hR", gs.reset_buffer, { desc = "gitsigns reset buffer" })
            map("n", "<leader>hp", gs.preview_hunk, { desc = "gitsigns preview hunk" })
            -- map("n", "<leader>hb", gs.blame_line, { desc = "gitsigns blame line" })
            map("n", "<leader>hb", function()
                gs.blame_line({ full = true })
            end, { desc = "gitsigns blame line" })
            map("n", "<leader>htb", gs.toggle_current_line_blame, { desc = "gitsigns toggle current line blame" })
            map("n", "<leader>hth", gs.toggle_linehl, { desc = "gitsigns toggle line highlight" })
            map("n", "<leader>htw", gs.toggle_word_diff, { desc = "gitsigns toggle word diff" })
            map("n", "<leader>hta", function()
                gs.toggle_linehl()
                gs.toggle_word_diff()
            end, { desc = "gitsigns toggle word diff and line highlight" })
            map("n", "<leader>hd", gs.diffthis, { desc = "gitsigns diff against the index" })
            map("v", "<leader>hD", function()
                gs.diffthis("~")
            end, { desc = "gitsigns diff agains last commit" })
            map("n", "<leader>htd", gs.toggle_deleted, { desc = "gitsigns toggle show deleted hunks" })
            -- Just let this be, the plugin doesn't work properly without it
            map({ "o", "x" }, "ih", "<C-U>Gitsigns select_hunk<CR>")
        end,
    },
}
