-- Configuration for LSP diagnostics
-- vim.diagnostic.config({
--   virtual_text = false, -- Turn off inline diagnostics
--   signs = true,
--   update_in_insert = false,
--   underline = true,
--   severity_sort = true,
--   float = { focusable = false, style = "minimal", border = "rounded", source = "always", header = "", prefix = "" }
-- })

local base_on_attach = function(_, bufnr)
  -- Format on save
  -- vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")

  local function buf_set_keymap(key, cmd)
    vim.api.nvim_buf_set_keymap(bufnr, "n", key, cmd, { noremap = true, silent = true })
  end

  -- vim.keymap.set("n", "gd", vim.lsp_definitions, { buffer = buffnr, desc = "vim.lsp_definitions" })
  -- vim.keymap.set("n", "gr", vim.lsp_references, { buffer = buffnr, desc = "vim.lsp_references" })
  -- vim.keymap.set("n", "gi", vim.lsp_implementations, { buffer = buffnr, desc = "vim.lsp_implementations" })

  buf_set_keymap("gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>")
  buf_set_keymap("gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
  buf_set_keymap("gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>")
  buf_set_keymap("[g", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  buf_set_keymap("]g", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  -- Docs: https://neovim.io/doc/user/lsp.html#vim.lsp.buf.code_action()
  -- quicfix
  buf_set_keymap("gf", "<cmd>lua vim.lsp.buf.code_action({apply=true, context={only={'quickfix'}}})<CR>")
  buf_set_keymap("gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
  buf_set_keymap("gR", "<cmd>lua vim.lsp.buf.rename()<CR>")

  -- Diagnostics 
  -- Via setloclist, setqflist
  -- Docs: https://neovim.io/doc/user/builtin.html#setqflist()
  -- buf_set_keymap("ge", "<cmd>lua vim.diagnostic.setqflist()<CR>")

  -- Docs: https://github.com/nvim-telescope/telescope.nvim/blob/master/doc/telescope.txt
  -- Docs: https://neovim.io/doc/user/diagnostic.html
  -- buf_set_keymap("ge", "<cmd>lua require('telescope.builtin').diagnostics( {severity_limit=vim.diagnostic.severity.WARN} )<CR>")
  buf_set_keymap("ge", "<cmd>lua require('telescope.builtin').diagnostics()<CR>")

  -- buf_set_keymap("gh", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  -- -- buf_set_keymap("<C-x><C-x>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  -- -- buf_set_keymap("gs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
-- local base_lsp = {
--   on_attach = base_on_attach,
--   capabilities = capabilities
-- }

-- ------------------

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- Completing framework:
        "hrsh7th/nvim-cmp",
        -- LSP completion source:
        "hrsh7th/cmp-nvim-lsp",
        -- Other completion sources:
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/vim-vsnip",
        "hrsh7th/cmp-vsnip",
        -- "L3MON4D3/LuaSnip",
        -- "saadparwaiz1/cmp_luasnip",

        -- https://github.com/j-hui/fidget.nvim
        -- Extensible UI for LSP progress
        "j-hui/fidget.nvim",
    },

    config = function()
        require("conform").setup({
            formatters_by_ft = {
            }
        })
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities())

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                -- "lua_ls",
                "rust_analyzer",
                "gopls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        on_attach = base_on_attach,
                        capabilities = capabilities
                    }
                end,

                -- zls = function()
                --     local lspconfig = require("lspconfig")
                --     lspconfig.zls.setup({
                --         root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                --         settings = {
                --             zls = {
                --                 enable_inlay_hints = true,
                --                 enable_snippets = true,
                --                 warn_style = true,
                --             },
                --         },
                --     })
                --     vim.g.zig_fmt_parse_errors = 0
                --     vim.g.zig_fmt_autosave = 0

                -- end,
                -- ["lua_ls"] = function()
                --     local lspconfig = require("lspconfig")
                --     lspconfig.lua_ls.setup {
                --         capabilities = capabilities,
                --         settings = {
                --             Lua = {
                --                 format = {
                --                     enable = true,
                --                     -- Put format options here
                --                     -- NOTE: the value should be STRING!!
                --                     defaultConfig = {
                --                         indent_style = "space",
                --                         indent_size = "2",
                --                     }
                --                 },
                --             }
                --         }
                --     }
                -- end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            -- snippet = {
            --     expand = function(args)
            --         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            --     end,
            -- },
            mapping = cmp.mapping.preset.insert({
                ['<Tab>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<S-Tab>'] = cmp.mapping.select_next_item(cmp_select),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'nvim_lsp_signature_help' },
                { name = 'vsnip' },
                -- { name = "copilot", group_index = 2 },
                -- { name = 'luasnip' }, -- For luasnip users.
            }, {
                { name = 'buffer' },
            }),
	          sorting = {
	              comparators = {
	          	  	  cmp.config.compare.offset,
	          	  	  cmp.config.compare.exact,
	          	  	  cmp.config.compare.score,
	          	  	  cmp.config.compare.recently_used,
	          	  	  -- require("cmp-under-comparator").under,
	          	  	  cmp.config.compare.kind,
	          	  },
	          },
        })

        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
