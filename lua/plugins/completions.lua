return {
	-- Completion engine
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"L3MON4D3/LuaSnip", -- Snippet engine
			"saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
			"rafamadriz/friendly-snippets", -- Predefined snippets
			"hrsh7th/cmp-nvim-lsp", -- LSP completion source
			"hrsh7th/cmp-buffer", -- Buffer completion source
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			-- Load VS Code-style snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- Use LuaSnip for snippet expansion
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection with Enter
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- LSP-based completions
					{ name = "luasnip" }, -- Snippet completions
				}, {
					{ name = "buffer" }, -- Buffer-based completions for context
					{ name = "copilot" },
				}),
				formatting = {
					-- Customize appearance of completion menu items
					fields = { "kind", "abbr", "menu" },
					format = function(entry, item)
						local menu_icon = {
							nvim_lsp = "[LSP]",
							luasnip = "[Snippet]",
							buffer = "[Buffer]",
						}
						item.menu = menu_icon[entry.source.name]
						return item
					end,
				},
			})

			-- Additional LuaSnip configuration (optional)
			luasnip.config.set_config({
				history = true,
				updateevents = "TextChanged,TextChangedI",
			})

			-- Keybinding for snippet expansion and navigation
			vim.keymap.set("i", "<Tab>", function()
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				else
					return "<Tab>"
				end
			end, { expr = true })
			vim.keymap.set("s", "<Tab>", function()
				luasnip.jump(1)
			end, { expr = true })
			vim.keymap.set("s", "<S-Tab>", function()
				luasnip.jump(-1)
			end, { expr = true })
		end,
	},
	-- LuaSnip snippet collection
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
}
