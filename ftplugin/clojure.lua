vim.lsp.start({
	name = "clojure-lsp",
	cmd = { "clojure-lsp" },
	root_dir = vim.fs.dirname(vim.fs.find({ "project.clj" }, { upward = true })[1]),
})
