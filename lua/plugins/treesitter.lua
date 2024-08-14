return {"nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    treesitterconfig = require("nvim-treesitter.configs")
    treesitterconfig.setup({
      auto_install = true,
      ensure_installed = {"lua", "javascript", "c", "vim", "vimdoc", "query", "heex", "elixir", "html", "rust"},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
 
