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
    },
  },
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },
  {
    'elixir-tools/elixir-tools.nvim',
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local elixir = require('elixir')
      local elixirls = require('elixir.elixirls')

      elixir.setup {
        nextls = { enable = false },
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = false,
            enableTestLenses = false,
          },
          on_attach = function(client, bufnr)
            vim.keymap.set('n', '<space>fp', ':ElixirFromPipe<cr>', { buffer = true, noremap = true })
            vim.keymap.set('n', '<space>tp', ':ElixirToPipe<cr>', { buffer = true, noremap = true })
            vim.keymap.set('v', '<space>em', ':ElixirExpandMacro<cr>', { buffer = true, noremap = true })
          end,
        },
        projectionist = {
          enable = true,
        },
      }
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    '3rd/image.nvim',
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {
      processor = 'magick_cli',
    },
  },
  {
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
        plantuml = {
          charset = nil,
          cli_args = nil, -- nil | { "-Djava.awt.headless=true" } | ...
        },
      },
    },
  },
  ---@type LazySpec
  {
    'mikavilpas/yazi.nvim',
    version = '*', -- use the latest stable version
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-lua/plenary.nvim', lazy = true },
    },
    keys = {
      {
        '<leader>cf',
        mode = { 'n', 'v' },
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file',
      },
      {
        -- Open in the current working directory
        '<leader>cw',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
      {
        '<c-up>',
        '<cmd>Yazi toggle<cr>',
        desc = 'Resume the last yazi session',
      },
    },
    ---@type YaziConfig | {}
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = '<f1>',
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- mark netrw as loaded so it's not loaded at all.
      --
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      vim.g.loaded_netrwPlugin = 1
    end,
  },
  {
    'cljoly/telescope-repo.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  },
  {
    'airblade/vim-rooter'
  },
}
