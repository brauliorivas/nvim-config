return {
  'dgagn/diagflow.nvim',
  event = 'LspAttach', -- This is what I use personnally and it works great
  opts = {
    update_event = { 'DiagnosticChanged' },
    show_borders = true,
    scope = 'line',
  },
}
