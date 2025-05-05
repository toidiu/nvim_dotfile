local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local mode_nv = { 'n', 'v' }

-- Utility -----------
keymap('n', '<Leader>p', ':set paste!<CR>:set paste?<CR>', opts)
keymap('n', '<Leader>h', ':nohlsearch<CR>', opts)

-- Buffer -----------
keymap('n', '<C-e>', ':e#<CR>', opts)
keymap('n', '<Leader>q', ':bd<CR>', opts)

-- Splits ----------
keymap('n', '<Leader>v', ':vsplit<CR>', opts)
keymap('n', '<Leader>s', ':split<CR>', opts)
keymap('n', 'f', ':vertical resize +10 <CR>', opts)
keymap('n', 'F', ':resize +5 <CR>', opts)

-- File ----------
-- undo
-- keymap('i', '<C-z>', '<Esc><Undo>', opts)
-- keymap('n', '<C-z>', '<Undo>', opts)
-- quit
keymap('i', '<C-d>', '<Esc>:q<CR>', opts)
keymap('n', '<C-d>', ':q<CR>', opts)
-- save
keymap('i', '<C-s>', '<Esc>:w<CR>', opts)
keymap(mode_nv, '<C-s>', ':w<CR>', opts)
-- nvim-tree toggle
keymap('n', '\\e', ':NvimTreeToggle<CR>', opts)

-- Move same term -----------
-- braces
keymap(mode_nv, 'b', '<C-%>', opts)
-- left
keymap(mode_nv, '<S-J>', '<C-D>', opts)
-- down
keymap(mode_nv, '<S-K>', '<C-U>', opts)
-- down
keymap(mode_nv, '<S-H>', 'b', opts)
-- right
keymap(mode_nv, '<S-L>', 'e', opts)

-- Move between term -----------
-- noremap <C-j> <C-W>j
keymap('n', '<C-j>', '<C-W>j', opts)
-- noremap <C-k> <C-W>k
keymap('n', '<C-k>', '<C-W>k', opts)
-- noremap <C-h> <C-W>h
keymap('n', '<C-h>', '<C-W>h', opts)
-- noremap <C-l> <C-W>l
keymap('n', '<C-l>', '<C-W>l', opts)

-- local t = function(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end

-- local check_back_space = function()
--   local col = vim.fn.col('.') - 1
--   return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
-- end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
-- _G.tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-n>"
--   elseif vim.fn['vsnip#available'](1) == 1 then
--     return t "<Plug>(vsnip-expand-or-jump)"
--   elseif check_back_space() then
--     return t "<Tab>"
--   else
--     return vim.fn['compe#complete']()
--   end
-- end
-- _G.s_tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-p>"
--   elseif vim.fn['vsnip#jumpable'](-1) == 1 then
--     return t "<Plug>(vsnip-jump-prev)"
--   else
--     -- If <S-Tab> is not working in your terminal, change it to <C-h>
--     return t "<S-Tab>"
--   end
-- end

-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
