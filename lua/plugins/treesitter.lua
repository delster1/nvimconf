return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local treesitterconfig = require("nvim-treesitter.configs")
    treesitterconfig.setup({
      -- Automatically install missing parsers when entering buffer
      auto_install = true,

      -- Ensure these language parsers are installed
      ensure_installed = {
        "lua", "javascript", "c", "vim", "vimdoc", "query",
        "heex", "elixir", "html", "rust"
      },

      -- Enable syntax highlighting
      highlight = {
        enable = true,
        -- Avoid running into runtime errors
        additional_vim_regex_highlighting = false,
      },

      -- Enable indentation based on treesitter
      indent = {
        enable = true,
        disable = { "python", "html" }, -- Disable for languages that may cause issues
      },

      -- Optional: Enable incremental selection for better UX
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },

      -- Optional: Enable text objects based on treesitter (useful for code navigation)
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    })
  end,
}
