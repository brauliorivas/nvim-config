vim.lsp.start({
  name = 'clangd',
  cmd = {'clangd15'},
  root_dir = vim.fs.dirname(vim.fs.find({'Makefile', 'main.c'}, { upward = true })[1]),
})
