return {
	"stevearc/conform.nvim",
	opts = {
		-- TODO: Add binding for recursive formatting of all files.
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofumpt" },
			-- Csharpier is a little TOO opinionated for me
			--cs = { "csharpier" },
			--cs = { "clang_format" },
			c = { "clang_format" },
			cpp = { "clang_format" },
			cmake = { "cmake_format" },
			rust = { "rustfmt" },
			-- NOTE: Beautysh appears to ALWAYS add a new line to the end of file on windows.
			--       Likely is just due to unix emulation problems.
			bash = { "beautysh" },
			zsh = { "beautysh" },
			sh = { "beautysh" },
			markdown = { "mdformat" },
		},
		-- TODO: Ideally want to swap this so there's a keybind to toggle this on and off.
		--       will have to make an autocommand instead of letting plugin handle it.
		format_on_save = {
			timeout_ms = 2000,
			lsp_fallback = true,
		},
	},
}
