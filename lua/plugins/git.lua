return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
  },
  {
    'tpope/vim-fugitive',
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
      -- Only one of these is needed.
      'nvim-telescope/telescope.nvim', -- optional
    },
    config = true,
  },
}
