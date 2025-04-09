return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				-- ... the rest of your lualine config
			},
		})
	end,
}
