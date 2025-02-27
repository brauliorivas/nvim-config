return {
	"MeanderingProgrammer/harpoon-core.nvim",
	config = function()
		require("harpoon-core").setup({
			default_action = nil,
			delete_confirmation = false,
		})
		require("telescope").load_extension("harpoon-core")

		---@param lhs string
		---@param rhs string|function
		---@param desc string
		local function map(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { desc = desc })
		end
		local mark = require("harpoon-core.mark")
		local ui = require("harpoon-core.ui")
		for i = 1, 9 do
			map(string.format("<leader>%d", i), function()
				ui.nav_file(i)
			end, string.format("Harpoon open file %d", i))
		end
		map("<C-h>", function() ui.nav_file(1) end, "Go to first file")
		map("<C-t>", function() ui.nav_file(2) end, "Go to second file")
		map("<C-n>", function() ui.nav_file(3) end, "Go to third file")
		map("<C-s>", function() ui.nav_file(4) end, "Go to fourth file")
		map("<leader>0", function() ui.nav_file(10) end, "Go to fourth file")
		map("<leader>a", mark.add_file, "Add current file")
		map("<leader>hr", mark.rm_file, "Remove current file")
		map("<leader>hu", ui.toggle_quick_menu, "Toggle UI")
		map("<leader>hn", ui.nav_next, "Next file")
		map("<leader>hp", ui.nav_prev, "Previous file")
		map("<C-e>", "<cmd>Telescope harpoon-core marks<cr>", "Telescope menu")
	end,
}
