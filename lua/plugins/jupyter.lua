return {
	"dccsillag/magma-nvim",
	run = ":UpdateRemotePlugins",
	config = function()
		vim.cmd [[
      let g:magma_automatically_open_output = v:false
      let g:magma_image_provider = "kitty"
    ]]

		-- Key mappings (feel free to adjust if you have conflicts)
		vim.keymap.set("n", "<Leader>r", "<Cmd>MagmaEvaluateOperator<CR>", { silent = true, expr = true })
		vim.keymap.set("n", "<Leader>rr", "<Cmd>MagmaEvaluateLine<CR>", { silent = true })
		vim.keymap.set("x", "<Leader>r", "<Cmd>MagmaEvaluateVisual<CR>", { silent = true })
		vim.keymap.set("n", "<Leader>rc", "<Cmd>MagmaReevaluateCell<CR>", { silent = true })
		vim.keymap.set("n", "<Leader>rd", "<Cmd>MagmaDelete<CR>", { silent = true })
		vim.keymap.set("n", "<reader>ro", "<Cmd>MagmaShowOutput<CR>", { silent = true })

		-- Functions to initialize different kernels
		vim.cmd [[
      function! MagmaInitPython()
          :MagmaInit python3
          :MagmaEvaluateArgument a=5
      endfunction

      function! MagmaInitCSharp()
          :MagmaInit .net-csharp
          :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof(System.Object),"text/plain");
      endfunction

      function! MagmaInitFSharp()
          :MagmaInit .net-fsharp
          :MagmaEvaluateArgument Microsoft.DotNet.Interactive.Formatting.Formatter.SetPreferredMimeTypesFor(typeof<System.Object>,"text/plain")
      endfunction

      command! MagmaInitPython call MagmaInitPython()
      command! MagmaInitCSharp call MagmaInitCSharp()
      command! MagmaInitFSharp call MagmaInitFSharp()
    ]]
	end,
}
