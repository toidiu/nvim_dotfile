return {
  {
    "tpope/vim-commentary",
    event = BUF_READ,
    keys = { mode = { "n", "v", "x" } },
    -- TODO: figure out how to lazily load vim-commentary, for some reason you need lazy = false and stuff
    lazy = false,
  },
}
