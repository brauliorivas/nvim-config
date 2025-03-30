vim.lsp.start({
	name = "pylsp",
	cmd = { "pylsp" },
	root_dir = vim.fs.dirname(
		vim.fs.find(
			{ "requirements.txt", "setup.py", "tox.ini", "requirements.txt", "Pipfile", "pyproject.toml" },
			{ upward = true }
		)[1]
	),
})
