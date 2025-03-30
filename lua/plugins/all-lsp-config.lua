return {
	{
		-- Mason for managing external tools
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},

	{
		-- Mason integration with LSP configurations
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
				},
				automatic_installation = true,
			})
		end,
	},

	{
		-- Core LSP configurations for Neovim
		"neovim/nvim-lspconfig",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			local lspconfig = require("lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			-- Setup capabilities with nvim-cmp support
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- Function to streamline setting up LSPs
			local function setup_lsp(server_name, opts)
				opts = opts or {}
				opts.capabilities = capabilities
				lspconfig[server_name].setup(opts)
			end

			-- LSP Servers setup
			setup_lsp("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
							disable = { "lowercase-global", "unused-local", "undefined-global", "undefined-return" },
						},
						workspace = { library = vim.api.nvim_get_runtime_file("", true) },
					},
				},
			})
			setup_lsp("ts_ls")
			setup_lsp("rust_analyzer")
			setup_lsp("bashls")
			setup_lsp("clangd")
			setup_lsp("pyright")

			-- Keybindings for LSP functions
			local on_attach = function(_, bufnr)
				local buf_map = function(mode, lhs, rhs, desc)
					vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true, desc = desc })
				end

				buf_map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover Documentation")
				buf_map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to Definition")
				buf_map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", "Find References")
				buf_map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to Implementation")
				buf_map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename Symbol")
				buf_map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action")
			end

			-- Attach custom `on_attach` function to each server
			for _, server in ipairs({
				"lua_ls",
				"ts_ls",
				"rust_analyzer",
				"bashls",
				"clangd",
				"gopls",
				"pyright",
			}) do
				setup_lsp(server, { on_attach = on_attach })
			end
		end,
	},
}
