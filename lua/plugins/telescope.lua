return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- "nvim-telescope/telescope-fzf-native.nvim",
    -- "nvim-telescope/telescope-live-grep-args.nvim",
    -- "burntsushi/ripgrep",
    -- "kyazdani42/nvim-web-devicons",
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    -- telescope.load_extension("live_grep_args")

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', ';', builtin.buffers, {})
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    -- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<C-a>', builtin.live_grep, {})

    -- search word under cursor
    -- vim.keymap.set('n', '<C-a>', function()
    --     local word = vim.fn.expand("<cword>")
    --     builtin.grep_string({ search = word })
    -- end)
    --
    -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end,
  -- keys = {
  -- -- keymap('n', '<Leader>;', builtin.buffers, { desc = 'Telescope buffers' })
  --   { ";", '<cmd>Telescope buffers<CR>', { desc = 'Telescope buffers' } },
  --   { "<C-p>", "<cmd>Telescope find_files<CR>" },
  --   -- { "<C-p>", "<cmd>Telescope git_files<CR>" },
  --   { "<C-a>", "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" },
  --   -- { "\\fo", "<cmd>Telescope oldfiles cwd_only=True<CR>" },
  --   -- { "\\tr", "<cmd>Telescope resume<CR>" },
  --   -- { "\\ch", "<cmd>Telescope command_history<CR>" }
  -- },
}
