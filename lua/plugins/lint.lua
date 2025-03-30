return {
	{
		"dense-analysis/ale",
		config = function()
			-- Configuration goes here.
			local g = vim.g
	
			g.ale_ruby_rubocop_auto_correct_all = 1
	
			g.ale_linters = {
				python = { "flake8" },
			}
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				htmldjango = { "djlint" },
				clojure = { "clj-kondo" },
				cpp = { "clangtidy" },
				javascript = { "eslint" },
				javascriptreact = { "eslint" }
			}

			local djlint = lint.linters.djlint
			djlint.args = {
				"--lint",
				"-",
			}

			vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
