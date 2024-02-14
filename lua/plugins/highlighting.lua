return {
	-- add more treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"html",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"tsx",
				"vim",
				"vimdoc",
				"yaml",
				"rust",
				"c",
				"cpp",
				"c_sharp",
				"diff",
				"gitcommit",
				"git_config",
				"gitignore",
				"gitattributes",
			},
			auto_install = true,
			-- For some reason this isn't working on this patch. Using manual enforcement instead.
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
		config = function(_, opts)
			-- Perform default setup before anything else. Lazyvim won't do this for is if we specify a config.
			require("nvim-treesitter.configs").setup(opts)
			-- Manually adds external parsers.
			---@class treesitterparser
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.hypr = {
				install_info = {
					url = "https://github.com/luckasRanarison/tree-sitter-hypr",
					files = { "src/parser.c" },
					branch = "master",
					--requires_generate_from_grammar = false,
				},
				filetype = "hypr",
			}
		end,
	},
	-- Polyglot for things not covered by treesitter.
	{
		"sheerun/vim-polyglot",
		-- Quick and dirty solution to make polyglot not use parsers intalled by treesitter.
		init = function()
			local parsers = require("nvim-treesitter.info").installed_parsers()
			for i = 1, #parsers do
				parsers[i] = parsers[i] .. ".plugin"
			end
			table.insert(parsers, 1, "sensible")
			vim.g.polyglot_disabled = parsers
		end,
	},

	-- Sway config syntax highlighting
	{ "jamespeapen/swayconfig.vim" },
	-- Hyprland config syntax highlighting
	{ "luckasRanarison/tree-sitter-hypr" },
	-- Gitsigns in pipe
	{ "lewis6991/gitsigns.nvim" },
	-- Colorise hexcode.
	{
		"norcalli/nvim-colorizer.lua",
		main = "colorizer",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
}
