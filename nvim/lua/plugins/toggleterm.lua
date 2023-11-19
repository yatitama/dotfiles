return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = {
        vim.api.nvim_set_keymap('', '<C-t><C-t>', ':ToggleTerm<CR>', { noremap = true, silent = true })
    },
}
