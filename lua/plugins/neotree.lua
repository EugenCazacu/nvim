return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local neotree = require("neo-tree")
        local neotreecmd = require("neo-tree.command")
        neotree.setup({
            source_selector = {
                winbar = true,
                statusline = false,
            },
            opts = {
                sources = { "filesystem", "buffers", "git_status", "document_symbols" },
                filesystem = {
                    bind_to_cwd = true,
                    follow_current_file = { enabled = true },
                    use_libuv_file_watcher = true,
                },
            },
            window = {
                mappings = {
                    ["<C-v>"] = "open_vsplit",
                    ["<C-s>"] = "open_split",
                },
                fuzzy_finder_mappings = {
                    ["<C-j>"] = "move_cursor_down",
                    ["<C-k>"] = "move_cursor_up",
                },
            },
            -- event_handlers = {
            --     {
            --         event = "file_opened",
            --         handler = function(file_path)
            --             -- auto close
            --             -- neotree.close_all()
            --             neotreecmd.execute({ action = "close" })
            --         end
            --     }
            -- }
        })
        vim.keymap.set("n", "<C-n>", function()
            neotreecmd.execute({ toggle = true, reveal = true })
        end, { desc = "Toggle file explorer (Neotree)" })
    end,
}
