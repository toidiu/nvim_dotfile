-- vim.g.mapleader = " "

-- Number of spaces that a <Tab> in the file counts for
vim.opt.tabstop = 2
-- Number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 2
-- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.softtabstop = 2
-- tabs expanded to spaces
vim.opt.expandtab = true
-- Do smart autoindenting when starting a new line
vim.opt.smartindent = true
-- Copy indent from current line when starting a new line
vim.opt.autoindent = true

-- When a bracket is inserted, briefly jump to the matching one
vim.opt.showmatch = true
-- text width to wrap on
vim.opt.textwidth = 80
-- show line numbers
vim.opt.number = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- Show tab characters, trailing whitespace
vim.opt.listchars:append {
  tab = ">-",
  trail = "~",
  extends = ">",
  precedes = "<",
}

-- set list "Show tabs as CTRL-I is displayed, display $ after end of line
vim.opt.list = true

vim.opt.termguicolors = true
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

vim.opt.spelllang = 'en_us'
vim.opt.spell = true
