vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = "," 
-- vim.opt.termguicolors = true

-- --THEME ROTATE LEADERrt
-- local current_theme_index = 1  -- Start with the first theme
-- vim.api.nvim_set_keymap('i', '<C-H>', '<C-w>', { noremap = true, silent = true })
-- -- Function to set a theme
-- local function set_theme(theme)
--     local success, _ = pcall(vim.cmd, "colorscheme " .. theme)
--     if success then
--         print("Switched to theme: " .. theme)
--     else
--         print("Failed to load theme: " .. theme)
--     end
-- end
-- --
-- -- -- Function to rotate themes
-- local function rotate_theme()
--     current_theme_index = (current_theme_index % #themes) + 1
--     set_theme(themes[current_theme_index])
-- end
--
-- -- Set initial theme
-- set_theme(themes[current_theme_index])

-- Keybinding to rotate themes
-- vim.keymap.set("n", "<leader>rt", colorscheme pywal, { desc = "Rotate Themes" })
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
local opts = {}

require("lazy").setup("plugins")
-- vim.notify = require("notify")
