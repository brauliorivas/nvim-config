vim.lsp.start({
	name = "jedi-language-server",
	cmd = { "jedi-language-server" },
	root_dir = vim.fs.dirname(
		vim.fs.find(
			{ "requirements.txt", "setup.py", "tox.ini", "requirements.txt", "Pipfile", "pyproject.toml" },
			{ upward = true }
		)[1]
	),
})
