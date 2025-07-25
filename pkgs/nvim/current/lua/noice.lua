require("noice").setup({
	routes = {
		{
			view = "notify",
			filter = { event = "msg_showmode" },
		},
		{
			filter = {
				event = "msg_show",
				kind = "",
				any = {
					{ find = "lines yanked" },
					{ find = "written" },
					{ find = "more line" },
					{ find = "line less" },
					{ find = "fewer lines" },
					{ find = "Compile successful" },
					{ find = "exit Nvim" },
				},
			},
			opts = { skip = true },
		},
	},
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		signature = {
			enabled = false,
		},
	},
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = false, -- position the cmdline and popupmenu together
		long_message_to_split = false, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true, -- add a border to hover docs and signature help
	},
})
