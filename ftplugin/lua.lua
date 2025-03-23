vim.lsp.start({
  name = 'luals',
  cmd = {'lua-language-server'},
  root_dir = vim.fs.dirname(vim.fs.find({'config', '.luarc.json', '.luarc.jsonc'}, { upward = true })[1]),
})
