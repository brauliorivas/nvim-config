return {
  'akinsho/toggleterm.nvim',
  opts = {
    open_mapping = [[<M-t>]],
  },
  config = function(_, opts)
    require('toggleterm').setup(opts)

    vim.api.nvim_create_autocmd('TermOpen', {
      pattern = 'term://*',
      callback = function()
        local opts = { buffer = 0 }

        vim.keymap.set('t', '<C-x>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end,
    })
  end,
  keys = {
    { '<leader>tf', '<cmd>TermNew direction=float<CR>', desc = 'Terminal float' },
    { '<leader>tv', '<cmd>TermNew direction=vertical<CR>', desc = 'Terminal vertical' },
    { '<leader>th', '<cmd>TermNew direction=horizontal<CR>', desc = 'Terminal horizontal' },
    { '<leader>tt', '<cmd>TermNew direction=tab<CR>', desc = 'Terminal tab' },
    { '<leader>ts', '<cmd>TermSelect<CR>', desc = 'Select terminal' },
  },
}
