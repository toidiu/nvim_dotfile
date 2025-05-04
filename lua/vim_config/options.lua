-- vim.g.mapleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.textwidth = 100
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.splitright = true
vim.opt.wrap = true

vim.opt.cmdheight = 2

-- Some servers have issues with backup files, see #649.
vim.opt.writebackup = false
vim.opt.backup = false

-- wrap cursor at beginning/end
vim.opt.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true,
  h = true,
  l = true,
}

-- persistent undo
vim.opt.undodir = "/Users/akothari/.local/share/nvim/undodir"
vim.opt.undofile = true

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append {
  c = true,
}

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime = 300

vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "screenline,number"
-- vim.opt.hi = "CursorLine ctermbg=NONE cterm=underline"

vim.api.nvim_set_hl(0, 'CursorLine', { underline = true })
