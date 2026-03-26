local map = vim.keymap.set

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    map('n', 'rn', vim.lsp.buf.rename, { buffer = args.buf })
    map('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    map('n', 'gf', vim.lsp.buf.format, { buffer = args.buf })
    map('n', 'ga', vim.lsp.buf.code_action, { buffer = args.buf })
    map('n', 'gs', vim.lsp.buf.signature_help, { buffer = args.buf })
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { 'source.organizeImports' } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, 'textDocument/codeAction', params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or 'utf-16'
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
})

vim.cmd('Emojify')
