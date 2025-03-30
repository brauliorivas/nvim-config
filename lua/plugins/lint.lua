return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require('lint')
    lint.linters_by_ft = {
      htmldjango = { 'djlint' },
      clojure = { 'clj-kondo' },
      cpp = { 'clangtidy' },
      c = { 'clangtidy' },
      javascript = { 'eslint' },
      javascriptreact = { 'eslint' },
      python = { 'flake8' },
    }

    local djlint = lint.linters.djlint
    djlint.args = {
      '--lint',
      '-',
    }

    vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePost' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
