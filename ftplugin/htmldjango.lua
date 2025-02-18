vim.lsp.start({
  name = 'html-language-server',
  cmd = {'vscode-html-language-server', "--stdio"},
  root_dir = vim.fs.dirname(vim.fs.find({'manage.py'}, { upward = true })[1]),
})
