return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {},
  keys = {
    {
      '<leader>gs',
      function()
        require('neogit').open()
      end,
      desc = 'Open Neogit',
    },
    { '<leader>gp', ':Neogit pull<CR>', desc = 'Neogit Pull', silent = true, noremap = true },
    { '<leader>gB', ':Telescope git_branches<CR>', desc = 'Git Branches', silent = true, noremap = true },
    { '<leader>bh', ':G blame<CR>', desc = 'Git Blame', silent = true, noremap = true },
  },
}
