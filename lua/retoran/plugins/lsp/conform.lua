return {
	"stevearc/conform.nvim",
	opts = {
		-- TODO: Add binding for recursive formatting of all files.
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofumpt" },
			cs = { "csharpier" },
			-- clang-format not compiling on windows
			-- due to insisting on compiling with MSVC
			-- could possibly try to find an alternative
			c = { "clang-format" },
			cpp = { "clang-format" },
			cmake = { "cmake_format" },
			rust = { "rustfmt" },
			bash = { "beautysh" },
			zsh = { "beautysh" },
			sh = { "beautysh" },
		},
		format_on_save = {
			timeout_ms = 2000,
			lsp_fallback = true,
		},
	},
}
