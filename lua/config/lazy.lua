-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

require("lualine").setup({
	sections = {
		lualine_c = { {
			"filename",
			path = 1,
		} },
	},
})

require("toggleterm").setup({
	open_mapping = [[<M-t>]],
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- local Terminal  = require('toggleterm.terminal').Terminal
-- local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
--
-- function _lazygit_toggle()
--   lazygit:toggle()
-- end

vim.api.nvim_set_keymap("n", "<leader><leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

require("mini.indentscope").setup()

require("actions-preview").setup({
	-- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
	diff = {
		ctxlen = 3,
	},

	-- priority list of external command to highlight diff
	-- disabled by defalt, must be set by yourself
	highlight_command = {
		-- require("actions-preview.highlight").delta(),
		-- require("actions-preview.highlight").diff_so_fancy(),
		-- require("actions-preview.highlight").diff_highlight(),
	},

	-- priority list of preferred backend
	backend = { "telescope" },

	-- options related to telescope.nvim
	telescope = vim.tbl_extend(
		"force",
		-- telescope theme: https://github.com/nvim-telescope/telescope.nvim#themes
		require("telescope.themes").get_dropdown(),
		-- a table for customizing content
		{
			-- a function to make a table containing the values to be displayed.
			-- fun(action: Action): { title: string, client_name: string|nil }
			make_value = nil,

			-- a function to make a function to be used in `display` of a entry.
			-- see also `:h telescope.make_entry` and `:h telescope.pickers.entry_display`.
			-- fun(values: { index: integer, action: Action, title: string, client_name: string }[]): function
			make_make_display = nil,
		}
	),
})


local none_ls = require("none-ls")
