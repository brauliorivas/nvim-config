local map = vim.keymap.set

-- Custom (theprimeagen)
map("v", "J", [[:m '>+1<CR>gv=gv]])
map("v", "K", [[:m '<-2<CR>gv=gv]])
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>pv", vim.cmd.Ex)
map("n", "<Leader>y", '"+y', { noremap = true, silent = true }) -- Copy to clipboard
map("v", "<Leader>y", '"+y', { noremap = true, silent = true }) -- Copy in visual mode
map("n", "<Leader>p", '"+p', { noremap = true, silent = true }) -- Paste from clipboard
map("n", "<Leader>P", '"+P', { noremap = true, silent = true }) -- Paste before cursor

map("n", "<leader>dn", vim.diagnostic.goto_next)
map("n", "<leader>dp", vim.diagnostic.goto_prev)

-- Tabs
-- Move to previous/next
map('n', '<leader>ta', ':$tabnew<CR>', { noremap = true })
map('n', '<leader>tc', ':tabclose<CR>', { noremap = true })
map('n', '<leader>to', ':tabonly<CR>', { noremap = true })
map('n', '<leader>tn', ':tabn<CR>', { noremap = true })
map('n', '<leader>tp', ':tabp<CR>', { noremap = true })
map('n', '<leader>tmp', ':-tabmove<CR>', { noremap = true })
map('n', '<leader>tmn', ':+tabmove<CR>', { noremap = true })

local opts = { noremap = true, silent = true }
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<leader>,', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<leader>.', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

map('n', '<leader>e', '<Cmd>Neotree<CR>')
