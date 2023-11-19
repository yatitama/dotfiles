return {
    {
        'nvim-telescope/telescope-file-browser.nvim',
	dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        config = function ()
            require('telescope').setup({
                defaults = {
                    sorting_strategy = "ascending",
                    layout_config = {
                        prompt_position = "top",
                    },
                },
    	})
            local builtin = require('telescope.builtin')
    	vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    	vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
    	vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    	vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.api.nvim_set_keymap('n', '<Leader>e', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true })
	require("telescope").load_extension("file_browser")
        end
    },
}
