local on_attach = function(client, bufnr)

  -- LSPが持つフォーマット機能を無効化する
  -- →例えばtsserverはデフォルトでフォーマット機能を提供しますが、利用したくない場合はコメントアウトを解除してください
  --client.server_capabilities.documentFormattingProvider = false

  -- 下記ではデフォルトのキーバインドを設定しています
  -- ほかのLSPプラグインを使う場合（例：Lspsaga）は必要ないこともあります

  local set = vim.keymap.set
  -- set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  -- set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  -- set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  set("n", "<C-m>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  set("n", "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
  set("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  set("n", "ma", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  -- set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
  set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")

end

local cmp_plugins = {
    {
        'hrsh7th/nvim-cmp',
	config = function ()
	    require('cmp').setup({
	        sources = {
		    { name = "nvim_lsp" },
		    { name = "buffer" },
		    { name = "path" },
		},
		mapping = require('cmp').mapping.preset.insert({
		    ["<C-p>"] = require('cmp').mapping.select_prev_item(),
		    ["<C-n>"] = require('cmp').mapping.select_next_item(),
		    ['<C-l>'] = require('cmp').mapping.complete(),
		    ['<C-e>'] = require('cmp').mapping.abort(),
		    ["<C-y>"] = require('cmp').mapping.confirm({ select = true }),
		}),
		experimental = {
		    ghost_text = false,
	        },
		formatting = {
		    format = require('lspkind').cmp_format({
		        mode = 'symbol',
			maxwidth = 50,
			ellipsis_char = '...',
		    })
		}
	    })
	    require('cmp').setup.cmdline({ '/', '?' }, {
	        mapping = require('cmp').mapping.preset.cmdline(),
		sources = {
		    { name = 'buffer' }
		}
	    })
	    require('cmp').setup.cmdline(':', {
	        mapping = require('cmp').mapping.preset.cmdline(),
	        sources = {
		    { name = 'cmdline' },
		    { name = 'path' },
		}
	    })
	end
    },
    {
        'hrsh7th/cmp-nvim-lsp',
    },
    {
        'hrsh7th/cmp-buffer',
    },
    {
        'hrsh7th/cmp-cmdline',
    },
    {
        'hrsh7th/cmp-path',
    },
    {
        'onsails/lspkind.nvim',
    },
}

return {
    cmp_plugins,
    {
        "williamboman/mason.nvim",
	build = ":MasonUpdate",
	opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
	    "hrsh7th/cmp-nvim-lsp",
	},
	config = function ()
	    require("mason-lspconfig").setup_handlers {
                function (server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        on_attach = on_attach, --keyバインドなどの設定を登録
                        capabilities = require("cmp_nvim_lsp").default_capabilities(), --cmpを連携
                    }
                end
	    }
	end
    },
    {
        'nvimdev/lspsaga.nvim',
	config = function ()
            require("lspsaga").setup({
                border_style = "single",
                symbol_in_winbar = {
                    enable = true,
                },
                code_action_lightbulb = {
                    enable = true,
                  },
                show_outline = {
                    win_width = 50,
                    auto_preview = false,
                },
            })
            vim.keymap.set("n", "K",  "<cmd>Lspsaga hover_doc<CR>")
            vim.keymap.set('n', 'gr', '<cmd>Lspsaga finder<CR>')
            vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
            vim.keymap.set("n", "ga", "<cmd>Lspsaga code_action<CR>")
            vim.keymap.set("n", "gn", "<cmd>Lspsaga rename<CR>")
            vim.keymap.set("n", "ge", "<cmd>Lspsaga show_line_diagnostics<CR>")
            vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
            vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
            vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>")
            -- vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga open_floaterm lazygit<CR>")
            vim.keymap.set("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]])
	end
    }
}
