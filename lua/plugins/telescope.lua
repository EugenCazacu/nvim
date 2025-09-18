return {
    "nvim-telescope/telescope.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "cmake -S . -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        },
        "folke/todo-comments.nvim",
    },

    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-?>"] = "which_key",
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<C-Down>"] = actions.cycle_history_next,
                        ["<C-Up>"] = actions.cycle_history_prev,
                        ["<C-l>"] = actions.preview_scrolling_right,
                        ["<C-h>"] = actions.preview_scrolling_left,
                        ["<Right>"] = actions.results_scrolling_right,
                        ["<Left>"] = actions.results_scrolling_left,
                        ["<C-n>"] = actions.cycle_previewers_next,
                        ["<C-p>"] = actions.cycle_previewers_prev,
                        ["<C-s>"] = actions.select_horizontal,
                    },
                },
            },
        })

        local keymap = vim.keymap
        keymap.set("n", "<C-p>", builtin.resume, { desc = "Resume previous telescope search" })

        -- File pickers
        keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files in cwd (current working directory)" })
        keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recently opened file" })
        keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })

        -- Text search
        keymap.set("n", "<leader>ft", builtin.live_grep, { desc = "Find Text in cwd (current working directory)" })
        keymap.set(
            "n",
            "<leader>fw",
            builtin.grep_string,
            { desc = "Find Word under cursor in cwd (current working directory)" }
        )

        -- Other pickers
        keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
        keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymap" })
        keymap.set("n", "<leader>fd", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })

        -- LSP pickers
        keymap.set("n", "<leader>fs", builtin.lsp_workspace_symbols, { desc = "Find Symbols in current project" })
        keymap.set("n", "<leader>fi", builtin.lsp_references, { desc = "Find Inbound references" })
        keymap.set("n", "<leader>gd", builtin.lsp_definitions, { desc = "Go to Definition of the word under cursor" })
        keymap.set(
            "n",
            "<leader>gt",
            builtin.lsp_type_definitions,
            { desc = "Go to definition of the Type under cursor" }
        )

        -- Git pickers
        keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Find files in Git" })
        keymap.set("n", "<leader>fga", builtin.git_commits, { desc = "Find All Git Commits" })
        keymap.set("n", "<leader>fgc", builtin.git_bcommits, { desc = "Find Git Buffer's Commits" })
        keymap.set("n", "<leader>fgb", builtin.git_branches, { desc = "Find Git Branch" })
        keymap.set("n", "<leader>fgs", builtin.git_stash, { desc = "Find Git Stash" })
        keymap.set("n", "<leader>fgf", builtin.git_status, { desc = "Find Git changed Files" })
    end,
}
