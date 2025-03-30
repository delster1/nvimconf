return {
  "norcalli/nvim-colorizer.lua",
  event = "VeryLazy", -- or "BufReadPost" if you want it early
  config = function()
    require("colorizer").setup({
      "*", -- enable for all filetypes
      css = { rgb_fn = true }, -- enable rgb(...) for CSS
      html = { names = false }, -- disable color names for HTML
    }, {
      mode = "background", -- default to background color
    })
  end,
}

