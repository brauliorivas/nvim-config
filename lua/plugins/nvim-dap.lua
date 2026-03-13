return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require('dap')

    dap.adapters.gdb = {
      type = 'executable',
      command = 'gdb',
      args = { '--interpreter=dap', '--eval-command', 'set print pretty on' },
    }
    dap.configurations.c = {
      {
        name = 'Launch',
        type = 'gdb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = 'Select and attach to process',
        type = 'gdb',
        request = 'attach',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        pid = function()
          local name = vim.fn.input('Executable name (filter): ')
          return require('dap.utils').pick_process({ filter = name })
        end,
        cwd = '${workspaceFolder}',
      },
      {
        name = 'Attach to gdbserver :1234',
        type = 'gdb',
        request = 'attach',
        target = 'localhost:1234',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
      },
    }
  end,
  keys = {
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'DAP Continue',
      mode = 'n',
    },
    {
      '<F10>',
      function()
        require('dap').step_over()
      end,
      desc = 'DAP Step Over',
      mode = 'n',
    },
    {
      '<F11>',
      function()
        require('dap').step_into()
      end,
      desc = 'DAP Step Into',
      mode = 'n',
    },
    {
      '<F12>',
      function()
        require('dap').step_out()
      end,
      desc = 'DAP Step Out',
      mode = 'n',
    },
    {
      '<Leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Toggle Breakpoint',
      mode = 'n',
    },
    {
      '<Leader>B',
      function()
        require('dap').set_breakpoint()
      end,
      desc = 'Set Breakpoint',
      mode = 'n',
    },
    {
      '<Leader>lp',
      function()
        require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
      end,
      desc = 'Set Log Point',
      mode = 'n',
    },
    {
      '<Leader>dr',
      function()
        require('dap').repl.open()
      end,
      desc = 'Open REPL',
      mode = 'n',
    },
    {
      '<Leader>dl',
      function()
        require('dap').run_last()
      end,
      desc = 'Run Last',
      mode = 'n',
    },
    {
      '<Leader>dh',
      function()
        require('dap.ui.widgets').hover()
      end,
      desc = 'DAP Hover',
      mode = { 'n', 'v' },
    },
    {
      '<Leader>dp',
      function()
        require('dap.ui.widgets').preview()
      end,
      desc = 'DAP Preview',
      mode = { 'n', 'v' },
    },
    {
      '<Leader>df',
      function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
      end,
      desc = 'DAP Frames',
      mode = 'n',
    },
    {
      '<Leader>ds',
      function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
      end,
      desc = 'DAP Scopes',
      mode = 'n',
    },
  },
}
