return {
  {
    'uga-rosa/ccc.nvim',
    event = 'VeryLazy',
    opts = {
      highlighter = { auto_enable = true, lsp = true },
    },
  },
  -- Autocompleting brackets or quotes
  {
    'windwp/nvim-autopairs',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = function()
      return {
        separator = ' ',
        highlight = true,
        depth_limit = 5,
        lazy_update_context = true,
        theme = 'gruvbox_dark',
      }
    end,
  },
  {
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
  },
  { 'wakatime/vim-wakatime', lazy = false },
  {
    'nvim-tree/nvim-web-devicons',
  },
  {
    'mbbill/undotree',
    config = function()
      vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
      print(2)
      if vim.fn.has('persistent_undo') == 1 then
        local target_path = vim.fn.expand('~/.undodir')

        -- Create the directory if it does not exist
        if vim.fn.isdirectory(target_path) == 0 then
          vim.fn.mkdir(target_path, 'p', '0700')
        end

        vim.opt.undodir = target_path
        vim.opt.undofile = true
      end
    end,
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
  },
  { 'echasnovski/mini.indentscope', version = '*' },
  { 'rcarriga/nvim-notify' },
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
  {
    'neovim/nvim-lspconfig',
  },
  {
    'dgagn/diagflow.nvim',
    event = 'LspAttach', -- This is what I use personnally and it works great
    opts = {
      update_event = { 'DiagnosticChanged' },
      show_borders = true,
      scope = 'line',
    },
  },
  { 'mrjones2014/smart-splits.nvim' },
  { 'mfussenegger/nvim-jdtls' },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    'VPavliashvili/json-nvim',
    ft = 'json', -- only load for json filetype
    config = function()
      vim.keymap.set('n', '<leader>jff', '<cmd>JsonFormatFile<cr>')
      vim.keymap.set('n', '<leader>jmf', '<cmd>JsonMinifyFile<cr>')
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    }
  },
}
