return {
	"norcalli/nvim-colorizer.lua",
	main = "colorizer",
	config = function()
		require("colorizer").setup()
	end,
}
