return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        -- Source: https://github.com/lewis6991/gitsigns.nvim?tab=readme-ov-file#%EF%B8%8F-installation--usage
        signs = {
          add          = { text = '+' },
          change       = { text = '~' },
          delete       = { text = '-' },
          topdelete    = { text = '-' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signs_staged_enable = false,
      })
    end
  },
}
