return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    kind = 'replace',
    disable_line_numbers = false,
    commit_editor = {
      kind = 'replace',
    },
    commit_select_view = {
      kind = 'replace',
    },
    log_view = {
      kind = 'replace',
    },
    reflog_view = {
      kind = 'replace',
    },
    stash = {
      kind = 'replace',
    },
    refs_view = {
      kind = 'replace',
    },
  },
  keys = {
    {
      '<leader>gs',
      require('neogit').open,
      desc = 'Open Neogit',
    },
    { '<leader>gp', ':Neogit pull<CR>', desc = 'Neogit Pull', silent = true, noremap = true },
    { '<leader>gB', ':Telescope git_branches<CR>', desc = 'Git Branches', silent = true, noremap = true },
    { '<leader>bh', ':G blame<CR>', desc = 'Git Blame', silent = true, noremap = true },
  },
}
