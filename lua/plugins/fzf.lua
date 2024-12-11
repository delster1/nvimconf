-- ~/.config/nvim/lua/plugins/fzf.lua
return {
	-- Install fzf binary
	{
		"junegunn/fzf",
		build = ":call fzf#install()", -- Installs the fzf binary on first load
	},
	-- Install fzf.vim plugin
	{
		"junegunn/fzf.vim",
		dependencies = { "junegunn/fzf" }, -- Ensure fzf is loaded first
		config = function()
			-- Optional: Customize keybindings
			vim.keymap.set("n", "<leader>ff", ":Files<CR>", { desc = "Find Files" })        -- Searches for files in the current directory
			-- vim.keymap.set("n", "<leader>fg", ":GFiles<CR>", { desc = "Find Git Files" })   -- Searches files in a Git repository
			vim.keymap.set("n", "<leader>fl", ":Lines<CR>", { desc = "Search in Lines" })   -- Searches in all loaded buffers
			vim.keymap.set("n", "<leader>fb", ":Buffers<CR>", { desc = "Find Buffers" })    -- Searches open buffers
			vim.keymap.set("n", "<leader>fh", ":History<CR>", { desc = "Command History" }) -- Searches command history
			vim.keymap.set("n", "<leader>fs", ":BLines<CR>", { desc = "Lines in Buffers" })
		end,
	},
}
