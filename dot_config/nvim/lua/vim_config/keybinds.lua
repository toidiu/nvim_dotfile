local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

vim.cmd('cabbrev h vert h')

keymap('n', '<Space>', '<C-w>', opts)

-- center search results when cycling through them
keymap('n', 'n', 'nzz', opts)
keymap('n', 'N', 'Nzz', opts)
