return {
	-- Maybe change from nvim-tree to neotree.
	-- https://github.com/nvim-neo-tree/neo-tree.nvim
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	opts = {
	},
	-- Takes opts from above.
	config = function(_, opts)
		local function open_nvim_tree(data)
			local directory = vim.fn.isdirectory(data.file) == 1
			if not directory then
				return
			else
				vim.cmd.cd(data.file)
			end
			require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
		end

		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

		require("nvim-tree").setup(opts)
	end,
	event = "VimEnter",
	enabled = not vim.g.neotree
}
