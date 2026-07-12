vim.g.mapleader = " "
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.config/nvim/undo')
vim.opt.mouse = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.keymap.set('n', '<leader>l', function()
	vim.opt.nu = not vim.opt.nu:get()
	vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, {desc = "toggle line numbers" })
-- Always use system clipboard for yank and paste
vim.keymap.set('v', 'y', '"+y', { desc = "Yank to macOS clipboard" })
vim.keymap.set('v', 'd', '"+d', { desc = "Cut to macOS clipboard" })
vim.keymap.set('n', 'p', '"+p', { desc = "Paste from macOS clipboard" })
vim.keymap.set('n', 'P', '"+P', { desc = "Paste from macOS clipboard" })

-- Optional: Make y and p also work in normal mode for line yank/paste
vim.keymap.set('n', 'y', '"+y', { desc = "Yank line to macOS clipboard" })
