-- require('plugins')
-- require('basic-plugins')
-- require('completion')
-- require('colorscheme')
-- require('keybinds')
-- require('options')
-- require('lsp')
-- require('treesitter')
-- require('telescope')
-- require('gutentags')
-- require('autocmd')

require("vim_config")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  install = { colorscheme = { "melange" } },
})
