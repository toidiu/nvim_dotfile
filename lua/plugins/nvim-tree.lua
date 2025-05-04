return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup(
      {
        filters = {
          dotfiles = false,
          git_ignored = false
        }
      }
    )

    -- Open or close the tree. See |nvim-tree-api.tree.toggle()|
    -- Calls: `api.tree.toggle({
    --   path = "<args>", find_file = false, update_root = false, focus = true,
    -- })`

    -- vim.keymap.set('n', '<C-t>', api.tree.toggle, {})

    -- vim.keymap.set('n', '<\\e>', NvimTreeToggle, {})
  end,
}
