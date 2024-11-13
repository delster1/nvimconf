-- Lazy.nvim
return {
	{
		"goolord/alpha-nvim",
		dependencies = {
			"echasnovski/mini.icons",
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("alpha").setup(require("alpha.themes.theta").config)
		end,
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		-- Lazy.nvim
		"TobinPalmer/Tip.nvim",
		event = "VimEnter",
		init = function()
			-- Default config
			--- @type Tip.config
			require("tip").setup({
				seconds = 2,
				title = "Tip!",
				url = "https://vtip.43z.one",
			})
		end,
	},
	{
		"rcarriga/nvim-notify",
	},
}
