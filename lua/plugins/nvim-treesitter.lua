return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    install_dir = vim.fn.stdpath('data') .. '/site',
  },
  config = function(_, opts)
    require 'nvim-treesitter'.setup(opts)

    local ts_languages = {
      'c',
      'lua',
      'vim',
      'vimdoc',
      'query',
      'elixir',
      'heex',
      'javascript',
      'html',
      'python',
      'java',
      'clojure',
      'json',
      'cpp',
      'typst',
      'astro',
      'css',
      'typescript',
      'go',
      'nix',
      'zsh',
      'bash',
    }

    require 'nvim-treesitter'.install(ts_languages)

    function table_concat(t1, t2)
      local t3 = {}
      for _, v in ipairs(t1) do
        table.insert(t3, v)
      end
      for _, v in ipairs(t2) do
        table.insert(t3, v)
      end
      return t3
    end

    vim.api.nvim_create_autocmd('FileType', {
      pattern = table_concat(ts_languages, {
        'javascriptreact',
      }),
      callback = function()
        vim.treesitter.start()
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
      end,
    })
  end,
}
