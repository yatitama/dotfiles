if vim.g.vscode then
    -- VSCode extension
    -- import config
    require('common')
    require('keymap')
    vim.api.nvim_set_keymap('n', '<Leader>gg', "<Cmd>lua require('vscode-neovim').call('search.action.openEditor')<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>gn', "<Cmd>lua require('vscode-neovim').call('search.action.openNewEditor')<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>e', "<Cmd>lua require('vscode-neovim').call('workbench.view.explorer')<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>ce', "<Cmd>lua require('vscode-neovim').call('github.copilot.interactiveEditor.explain')<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>cd', "<Cmd>lua require('vscode-neovim').call('github.copilot.interactiveEditor.generateDocs')<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>cc', "<Cmd>lua require('vscode-neovim').call('workbench.action.openChat.copilot')<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>cs', "<Cmd>lua require('vscode-neovim').call('inlineChat.start')<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<Leader>tn', "<Cmd>lua require('vscode-neovim').call('settings.cycle.lineNumbers')<CR>", { noremap = true, silent = true })
    -- init lazy.nvim
else
    -- import config
    require('common')
    require('keymap')
    -- init lazy.nvim
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable", -- latest stable release
	lazypath,
      })
    end
    vim.opt.rtp:prepend(lazypath)
    require("lazy").setup('plugins', opts)
    require('colorscheme')
end
