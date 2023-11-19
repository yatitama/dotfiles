return {
    'easymotion/vim-easymotion',
    config = function ()
        vim.api.nvim_set_keymap('n', 's', '<Plug>(easymotion-overwin-f2)', { noremap = true })
        vim.api.nvim_set_keymap('n', '<Leader>j', '<Plug>(easymotion-j)', {})
        vim.api.nvim_set_keymap('n', '<Leader>k', '<Plug>(easymotion-k)', {})
    end
}
