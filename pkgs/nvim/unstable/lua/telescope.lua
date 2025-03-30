require("telescope").load_extension("ui-select")
require("telescope").setup({
	defaults = {
		prompt_prefix = "  ",
		selection_caret = " ",
		path_display = { "filename_first" },
		layout_config = {
			prompt_position = "top",
		},
		sorting_strategy = "ascending",
		mappings = {
			i = {
				-- ["<C-h>"] = "which_key",
				-- ["<C-j>"] = require("telescope.actions").move_selection_next,
				-- ["<C-k>"] = require("telescope.actions").move_selection_previous,
			},
		},
		file_ignore_patterns = {
			".git/",
			".idea/",
			"node_modules/",
			"target/", -- Java build directories
			"bin/", -- Go binaries
			"out/", -- JavaScript/TypeScript build outputs
			"build/",
			"dist/",
			".vscode/",
			".gradle/",
			"*.class", -- Java compiled files
			"*.jar", -- Java archives
			"*.war", -- Java web archives
			"*.exe", -- Executables (Go binaries)
			"*.so", -- Shared objects (Go)
			"*.d.ts", -- TypeScript definition files
			"*.log", -- Log files}
		},
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--hidden" },
		},
	},
	extensions = {},
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope find grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fc", function() builtin.live_grep({ default_text = vim.fn.expand("<cword>"), }) end, { desc = "Telescope find text under cursor" })
vim.keymap.set("n", "<leader>fn", ":Telescope notify<CR>", { desc = "Telescope find text under cursor" })
