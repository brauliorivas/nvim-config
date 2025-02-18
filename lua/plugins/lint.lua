return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			python = { 'flake8'},
			htmldjango = { 'djlint'},
		}
		lint.linters = {
			djlint = {
				cmd = "djlint",
				args = {
					"--lint",
					"-",
				}
			}
		}
	end
}
