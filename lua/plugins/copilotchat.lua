return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim', branch = 'master' },
  },
  build = 'make tiktoken',
  opts = {
    temperature = 0.1, -- Lower = focused, higher = creative
    trusted_tools = nil, -- Require approval for all tool calls
    window = {
      layout = 'vertical', -- 'vertical', 'horizontal', 'float'
      width = 0.3,
    },
    auto_insert_mode = true, -- Enter insert mode when opening
  },
}
