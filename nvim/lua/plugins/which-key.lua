local telescope = require('telescope.builtin')
return {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function ()
        local wk = require('which-key')
	wk.register(
	    {
        	l = {
        	    name = 'LSP',
		    a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Action' },
        	    h = { '<cmd>Lspsaga hover_doc<CR>', 'Hover info' },
        	    d = { '<cmd>Lspsaga peek_definition<CR>', 'Go to definition' },
        	    r = { '<cmd>Lspsaga finder<CR>', 'Find reference' },
        	    o = { '<cmd>Lspsaga outline<CR>', 'Outline' },
        	    [']'] = { '<cmd>Lspsaga diagnostic_jump_next<CR>', 'Next diagnostic' },
        	    ['['] = { '<cmd>Lspsaga diagnostic_jump_prev<CR>', 'Prev diagnostic' },
        	},
		t = {
		    name = 'Telescope',
		    p = { telescope.find_files, 'Open file' },
		    g = { telescope.live_grep, 'Grep' },
		    b = { telescope.buffers, 'Buffer' },
		    h = { telescope.help_tags, 'Help' },
		    t = { telescope.treesitter, 'Treesitter' },
		    e = { ':Telescope file_browser path=%:p:h select_buffer=true<CR>', 'Explorer' },
		},
		o = {
		    name = 'Obsidian',
		    n = { ':ObsidianNew', 'New file' },
		    p = { ':ObsidianQuickSwitch<CR>', 'Find file' },
		    f = { ':ObsidianFollowLink<CR>', 'Follow link' },
		    b = { ':ObsidianBacklinks<CR>', 'Back link' },
		    t = { ':ObsidianToday<CR>', 'Today file' },
		    g = { ':ObsidianSearch<CR>', 'Grep' },
		    l = { ':ObsidianLinkNew<CR>', 'Link new' },
		}
	    },
            {
	        prefix = '<Leader>',
	    }
        )
    end
}
