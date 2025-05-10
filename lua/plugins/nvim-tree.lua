local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- Source: https://github.com/nvim-tree/nvim-tree.lua/discussions/2292#discussioncomment-6271971
  local function move_file_to()
    local node = api.tree.get_node_under_cursor()
    local file_src = node['absolute_path']
    local file_out = vim.fn.input("MOVE TO: ", file_src, "file")
    local dir = vim.fn.fnamemodify(file_out, ":h")
    vim.fn.system { 'mkdir', '-p', dir }
    vim.fn.system { 'mv', file_src, file_out }
  end


  -- Source: https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#nerdtree-style-copy-file-to
  local function copy_file_to()
    local node = api.tree.get_node_under_cursor()
    local file_src = node['absolute_path']
    -- The args of input are {prompt}, {default}, {completion}
    -- Read in the new file path using the existing file's path as the baseline.
    local file_out = vim.fn.input("COPY TO: ", file_src, "file")
    -- Create any parent dirs as required
    local dir = vim.fn.fnamemodify(file_out, ":h")
    vim.fn.system { 'mkdir', '-p', dir }
    -- Copy the file
    vim.fn.system { 'cp', '-R', file_src, file_out }
  end

  vim.keymap.set("n", "<CR>", function()
    local node = api.tree.get_node_under_cursor()
    if vim.fn.isdirectory(node.absolute_path) == 1 then
      return api.tree.change_root_to_node(node)
    else
      return api.node.open.edit(node)
    end
  end, opts("edit_cd"))

  -- Toggle directory/Open File under cursor
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
  vim.keymap.set('n', 'mm', move_file_to, opts('Move File To'))
  vim.keymap.set("n", "mc", copy_file_to, opts("Copy"))
  vim.keymap.set("n", "ma", api.fs.create, opts("Create"))
  vim.keymap.set("n", "md", api.fs.remove, opts("Delete"))
  vim.keymap.set("n", "mg", api.tree.toggle_hidden_filter, opts("Toggle Git Ignore"))

  -- vim.keymap.set("n", "q", api.tree.close, opts("Close"))
  -- vim.keymap.set("n", "<Esc>", api.tree.close, opts("Close"))
  -- vim.keymap.set("n", "<Right>", api.node.open.edit, opts("Open"))
  -- vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  -- vim.keymap.set("n", "<Left>", api.node.navigate.parent_close, opts("Close Directory"))
  -- vim.keymap.set("n", "mm", api.fs.rename, opts("Rename"))
  -- vim.keymap.set("n", "++", api.node.navigate.git.next, opts("Next Git"))
  -- vim.keymap.set("n", "--", api.node.navigate.git.prev, opts("Prev Git"))
  -- vim.keymap.set("n", "o", api.node.open.preview, opts("Open Preview"))
  -- vim.keymap.set("n", "K", api.node.show_info_popup, opts("Info"))
  -- vim.keymap.set("n", "zi", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
  -- vim.keymap.set("n", "vh", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    -- Disable file icons to increase focus
    -- "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup(
      -- Docs: https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
      {
        view = { adaptive_size = true },
        update_focused_file = { enable = true },
        on_attach = on_attach,

        ---markers
        renderer = {
          indent_markers = { enable = true },
          indent_width = 2,
          special_files = {},

          icons = {
          symlink_arrow = " -> ",
            show = {
              file = false,
            },
          },

        },
        diagnostics = { enable = false },
        git = { enable = false },


        ---- filters
        filters = {
          dotfiles = true,
          git_ignored = false,
          -- custom = { "^__pycache__" },
        }
      }
    )
  end,
}
