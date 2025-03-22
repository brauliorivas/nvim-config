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
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
            print(2)
			if vim.fn.has("persistent_undo") == 1 then
				local target_path = vim.fn.expand("~/.undodir")

				-- Create the directory if it does not exist
				if vim.fn.isdirectory(target_path) == 0 then
					vim.fn.mkdir(target_path, "p", "0700")
				end

				vim.opt.undodir = target_path
				vim.opt.undofile = true
			end
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
	{ "echasnovski/mini.indentscope", version = "*" },
}
