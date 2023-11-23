return {
    -- Completion
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
    -- LSP
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
                        on_attach = function(client, bufnr)
                            -- local set = vim.keymap.set
                            -- set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
			end,
                        capabilities = require("cmp_nvim_lsp").default_capabilities(), --cmpを連携
                    }
                end
	    }
	end
    },
    {
        'nvimdev/lspsaga.nvim',
	config = function ()
	    require('lspsaga').setup({
	        ui = {
		    border = 'double',
		    code_action = '',
		},
	    })
	end
    },
}
