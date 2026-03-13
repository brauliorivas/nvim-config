return {
  'sindrets/diffview.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>do', ':DiffviewOpen<CR>', desc = 'Open Diffview' },
    { '<leader>dc', ':DiffviewClose<CR>', desc = 'Close Diffview' },
  },
  config = function()
    require('diffview').setup({
    })
  end,
}
