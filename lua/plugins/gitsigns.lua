return {
  'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
  config = function()
    require('gitsigns').setup({
      current_line_blame = true,
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set(
          'n',
          '<leader>hp',
          require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = 'Preview git hunk' }
        )

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns

        vim.keymap.set({ 'n', 'v' }, ']h', function()
          if vim.wo.diff then
            return ']h'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Goto next hunk' })

        vim.keymap.set({ 'n', 'v' }, '[h', function()
          if vim.wo.diff then
            return '[h'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Goto prev hunk' })

        vim.keymap.set('n', '<leader>gb', function()
          gs.blame_line({ full = true })
        end, { buffer = bufnr, desc = 'Preview git blame' })
      end,
    })

    local diffview_open = function()
      vim.cmd('DiffviewOpen')
    end
    local diffview_close = function()
      vim.cmd('DiffviewClose')
    end

    local map = vim.keymap.set
    map('n', '<leader>dfo', diffview_open, { desc = 'Open default diffview' })
    map('n', '<leader>dfl', diffview_close, { desc = 'Open default diffview' })
  end,
}
