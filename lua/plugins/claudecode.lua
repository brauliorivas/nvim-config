return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  opts = {
    terminal_cmd = 'ollama launch claude',
    terminal = {
      snacks_win_opts = {
        position = 'right',
        width = 0.3,
        height = 1,
        border = 'rounded',
        keys = {
          -- Multiple ways to hide from terminal mode
          claude_hide_alt = {
            '<M-,>',
            function(self)
              self:hide()
            end,
            mode = 't',
            desc = 'Hide (Alt+,)',
          },
        },
      },
    },
  },
  config = true,
  keys = {
    { 'co', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
    { 'cr', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
    { 'cC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
    { 'cm', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
    { 'cab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
    { 'cs', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
    {
      'cat',
      '<cmd>ClaudeCodeTreeAdd<cr>',
      desc = 'Add file',
      ft = { 'NvimTree', 'neo-tree', 'oil', 'minifiles', 'netrw' },
    },
    -- Diff management
    { 'ca', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
    { 'cd', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
    -- Claude Code
    { 'cc', '<cmd>ClaudeCodeFocus<cr>', desc = 'Toggle Claude', mode = { 'n', 'x' } },
  },
}
