local remap = vim.keymap.set
local builtin = require("telescope.builtin")

-- Custom (theprimeagen)
remap("v", "J", [[:m '>+1<CR>gv=gv]])
remap("v", "K", [[:m '<-2<CR>gv=gv]])
remap("n", "J", "mzJ`z")
remap("n", "<C-d>", "<C-d>zz")
remap("n", "<C-u>", "<C-u>zz")
remap("n", "n", "nzzzv")
remap("n", "N", "Nzzzv")
remap("n", "<leader>pv", vim.cmd.Ex)
remap("n", "<Leader>y", '"+y', { noremap = true, silent = true }) -- Copy to clipboard
remap("v", "<Leader>y", '"+y', { noremap = true, silent = true }) -- Copy in visual mode
remap("n", "<Leader>p", '"+p', { noremap = true, silent = true }) -- Paste from clipboard
remap("n", "<Leader>P", '"+P', { noremap = true, silent = true }) -- Paste before cursor

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		remap("n", "gd", builtin.lsp_definitions, { buffer = args.buf })
		remap("n", "gr", builtin.lsp_references, { buffer = args.buf })
		remap("n", "rn", vim.lsp.buf.rename, { buffer = args.buf })
		remap("n", "gI", builtin.lsp_implementations, { buffer = args.buf })
		remap("n", "gD", builtin.diagnostics, { buffer = args.buf })
		remap("n", "gi", builtin.lsp_incoming_calls, { buffer = args.buf })
		remap("n", "go", builtin.lsp_outgoing_calls, { buffer = args.buf })
		remap("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
		remap("n", "gff", vim.lsp.buf.format, { buffer = args.buf })
		remap("n", "ga", vim.lsp.buf.code_action, { buffer = args.buf })
		remap("n", "gs", vim.lsp.buf.signature_help, { buffer = args.buf })
	end,
})
