-- Configuration for LSP diagnostics
vim.diagnostic.config({
  virtual_text = false, -- Turn off inline diagnostics
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = { focusable = false, style = "minimal", border = "rounded", source = "always", header = "", prefix = "" }
})

local base_on_attach = function(_, bufnr)
  -- Format on save
  vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")

  local function buf_set_keymap(key, cmd)
    vim.api.nvim_buf_set_keymap(bufnr, "n", key, cmd, { noremap = true, silent = true })
  end

  buf_set_keymap("gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>")
  buf_set_keymap("gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
  buf_set_keymap("gs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
  buf_set_keymap("gi", "<cmd>lua require('telescope.builtin').lsp_implementations<CR>")
  buf_set_keymap("<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  buf_set_keymap("gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  buf_set_keymap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  buf_set_keymap("[a", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  buf_set_keymap("]a", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  buf_set_keymap("ga", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  buf_set_keymap("<C-x><C-x>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  buf_set_keymap("gl", "<cmd>lua vim.diagnostic.open_float()<CR>")
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local base_lsp = {
  on_attach = base_on_attach,
  capabilities = capabilities
}

return {
  {
    "neovim/nvim-lspconfig",
    config = function(_, opts)
      local servers = {
        "lua_ls",
        "rust_analyzer",
        "gopls",
        "clangd",
      }

      local lspconfig = require("lspconfig")
      for _, server in ipairs(servers) do
        local settings = opts.servers[server]
        local actual_settings = settings ~= nil and settings or base_lsp
        lspconfig[server].setup(actual_settings)
      end
    end,
    dependencies = {
      "hrsh7th/nvim-cmp"
    },
    event = "BufReadPre",
    opts = {
      inlay_hints = { enabled = true },
      servers = {
        lua_ls = {
          flags = {},
          on_attach = base_on_attach,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                }
              }
            }
          }
        },
        clangd = {
          on_attach = base_on_attach,
          capabilities = capabilities,
          filetypes  = { 'cpp' },
        },
      },
    },
  },
}
