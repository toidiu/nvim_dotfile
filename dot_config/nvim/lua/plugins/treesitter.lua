return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "python", "rust", "lua", "vimdoc", "c", "cpp" },
      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false
      },
      index = {
        enable = false
      }
    })
  end
}
