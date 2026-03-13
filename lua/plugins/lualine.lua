return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    separator = ' ',
    highlight = true,
    depth_limit = 5,
    lazy_update_context = true,
    theme = 'gruvbox_dark',
  },
  sections = {
    lualine_c = { {
      'filename',
      path = 1,
    } },
  },
}
