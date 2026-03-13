return {
  'echasnovski/mini.surround',
  version = false,
  event = 'VeryLazy',
  config = function()
    local surround = require('mini.surround')
    surround.setup({
      mappings = {
        add = 'su',
      },
    })
  end,
}
