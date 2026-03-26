return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { '<leader>ff', require('telescope.builtin').find_files, desc = 'Telescope Find Files' },
    { '<leader>fg', require('telescope.builtin').live_grep, desc = 'Telescope Live Grep' },
    { '<leader>fb', require('telescope.builtin').buffers, desc = 'Telescope Buffers' },
    { '<leader>fs', require('telescope.builtin').git_status, desc = 'Telescope Git Status' },
    { '<leader>fh', require('telescope.builtin').help_tags, desc = 'Telescope Help Tags' },
    { '<leader>ft', ':Telescope telescope-tabs list_tabs<CR>', desc = 'Telescope Tabs' },
  },
  opts = {
    defaults = {
      theme = 'center',
      sorting_strategy = 'ascending',
      layout_config = {
        horizontal = {
          prompt_position = 'top',
          preview_width = 0.5,
        },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
      repo = {
        search_dirs = { '~', '/etc/nixos', '/shared' },
      },
    },
  },
  config = function(_, opts)
    local telescope = require('telescope')
    telescope.setup(opts)

    telescope.load_extension('fzf')
    telescope.load_extension('scope')
    telescope.load_extension('harpoon-core')
    telescope.load_extension('zoxide')
    telescope.load_extension('file_browser')

    local builtin = require('telescope.builtin')
    local map = vim.keymap.set

    map('n', '<leader>cd', telescope.extensions.zoxide.list)
    map('n', '<leader>fw', telescope.extensions.file_browser.file_browser)

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        map('n', 'gd', builtin.lsp_definitions, { buffer = args.buf })
        map('n', 'gr', builtin.lsp_references, { buffer = args.buf })
        map('n', 'gI', builtin.lsp_implementations, { buffer = args.buf })
        map('n', 'gD', builtin.diagnostics, { buffer = args.buf })
        map('n', 'gi', builtin.lsp_incoming_calls, { buffer = args.buf })
      end,
    })
  end,
}
