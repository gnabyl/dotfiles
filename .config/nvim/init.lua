-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 0
vim.o.expandtab = false
vim.o.incsearch = true

vim.o.textwidth = 80
vim.o.colorcolumn = "+1"

-- Clear search highlight
vim.keymap.set('n', "<C-c>", ":nohls<CR>")

-- Relative line numbers toggle
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true

_G.toggle_line_numbers = function()
	if vim.o.relativenumber then
		vim.o.number = true
		vim.o.relativenumber = false
	else
		vim.o.number = true
		vim.o.relativenumber = true
	end
end
vim.keymap.set('n', "<CR>", "<cmd>lua toggle_line_numbers()<CR>", { noremap = true, silent = true})

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
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

require("lazy").setup("plugins")
