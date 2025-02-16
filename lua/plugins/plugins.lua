return {
	{
		"uga-rosa/ccc.nvim",
		event = "VeryLazy",
		opts = {
			highlighter = { auto_enable = true, lsp = true },
		},
	},
	-- Autocompleting brackets or quotes
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return {
				separator = " ",
				highlight = true,
				depth_limit = 5,
				lazy_update_context = true,
				theme = "gruvbox_dark",
			}
		end,
	},
	{
		"echasnovski/mini.surround",
		version = false,
		event = "VeryLazy",
		config = function()
			local surround = require("mini.surround")
			surround.setup({
				mappings = {
					add = "su",
				},
			})
		end,
	},
	{ "wakatime/vim-wakatime", lazy = false },
}
