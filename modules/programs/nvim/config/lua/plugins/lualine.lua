return {
	"nvim-lualine/lualine.nvim",
	depnndencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
			},
		})
	end,
}
