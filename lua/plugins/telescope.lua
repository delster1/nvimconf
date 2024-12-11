return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	dependencies = { 'nvim-lua/plenary.nvim' },
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local open_with_trouble = require("trouble.sources.telescope").open

		-- Use this to add more results without clearing the trouble list
		local add_to_trouble = require("trouble.sources.telescope").add

		-- Setup Telescope with defaults and additional configuration
		telescope.setup({
			defaults = {
				prompt_prefix = "🔍 ", -- Custom prompt icon
				selection_caret = "➜ ", -- Custom caret icon
				layout_strategy = "flex", -- Flex layout adjusts to window size
				layout_config = {
					horizontal = { preview_width = 0.5 },
					vertical = { preview_height = 0.5 },
				},
				file_ignore_patterns = { -- Ignore specific files/directories
					"node_modules",
					".git/",
					"__pycache__",
					"dist/",
				},
				mappings = {
					i = {
						["<C-u>"] = false, -- Disable Ctrl+U for clearing prompt
						["<c-t>"] = open_with_trouble,
						["<C-d>"] = false, -- Disable Ctrl+D to prevent accidental close
					},
					n = {

						["<c-t>"] = open_with_trouble,
					}
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown", -- Use dropdown theme for find_files
				},
			},
			extensions = {
				-- Additional Telescope extensions can be loaded here
			},
		})

		-- Keybindings for various Telescope functions
		vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = "Find Files" })
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Buffers" })
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Help Tags" })

		-- Load Telescope extensions if needed
		-- telescope.load_extension('your_extension_name')
	end
}
