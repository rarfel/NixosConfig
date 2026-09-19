return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
        "clangd",
        },
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
      vim.lsp.config('clangd',{
        init_options = {
          fallbackFlags = {'--std=c++20'} --Making clangd to reconize c++20 features
        },
      })
		},
	},
}
