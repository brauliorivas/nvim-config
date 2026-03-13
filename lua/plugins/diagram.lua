return {
  '3rd/diagram.nvim',
  dependencies = {
    { '3rd/image.nvim' }, -- you'd probably want to configure image.nvim manually instead of doing this
  },
  opts = { -- you can just pass {}, defaults below
    events = {
      render_buffer = { 'InsertLeave', 'BufWinEnter', 'TextChanged' },
      clear_buffer = { 'BufLeave' },
    },
    renderer_options = {
      mermaid = {
        theme = 'forest',
      },
      plantuml = {
        charset = 'utf-8',
      },
    },
  },
  config = function(_, opts)
    opts.integrations = {
      require('diagram.integrations.markdown'),
      require('diagram.integrations.neorg'),
    }
    require('diagram').setup(opts)
  end,
}
