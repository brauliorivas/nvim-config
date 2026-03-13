return {
  'ronisbr/emojify.nvim',
  config = function()
    require('emojify').setup({
      inlay = false,
    })
  end,
  lazy = false,
}
