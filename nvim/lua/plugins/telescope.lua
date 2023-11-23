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
	    require("telescope").load_extension("file_browser")
        end
    },
}
