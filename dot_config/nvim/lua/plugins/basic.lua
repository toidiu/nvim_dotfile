return {
  {
    "tpope/vim-commentary",
    event = BUF_READ,
    keys = { mode = { "n", "v", "x" } },
    -- TODO: figure out how to lazily load vim-commentary, for some reason you need lazy = false and stuff
    lazy = false,
  },
  {
    "lewis6991/gitsigns.nvim",
    -- TODO: remove config = true
    config = true,
    event = { "BufReadPre", "BufReadPost", "BufNewFile" },
  },
  "ludovicchabant/vim-gutentags",
}
