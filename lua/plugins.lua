-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies". 
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Colour scheme

	use {'bluz71/vim-nightfly-colors', as = 'nightfly',
		config = function()
			vim.g.nightflyTransparent = true
			vim.g.nightflyCursorColor = true
			vim.g.nightflyItalics = true
			vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", fg = "#c3ccdc"})
			vim.cmd.colorscheme('nightfly')
		end
	}

	use {'L3MON4D3/LuaSnip', as='LuaSnip',
	config = function() require('luasnip.loaders.from_vscode').lazy_load() end}
	use { 'hrsh7th/nvim-cmp', after='LuaSnip', config = function() require('config.nvimcmp').setup() end}
	use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }        -- buffer auto-completion
	use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }          -- path auto-completion
	use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }       -- cmdline auto-completion
	use {'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'}


	-- lspconfig needs neodev as of the moment.
	use {'folke/neodev.nvim', as = 'neodev',
	--config = function () require("neodev").setup({}) end
	}

	use {'neovim/nvim-lspconfig', as = 'lspconfig', after = 'neodev'}

	use { 'hrsh7th/cmp-nvim-lsp',
		config = function() require('config.lsp').setup() end,
		after = {'nvim-cmp', 'lspconfig'}
	}
	--NON-CRITICAL
	-- Other UI
	vim.g.neo_tree_remove_legacy_commands = true
	use {'nvim-neo-tree/neo-tree.nvim', after = 'nightfly',
		requires = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim'
		}
	}

	-- Syntax Highlighting
	use
	{
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
		config = function() require('config.treesitter').setup() end
    }
	use {'norcalli/nvim-colorizer.lua',
		config = function () require("colorizer").setup() end
	}

	-- Git stuff
	use {'tpope/vim-fugitive'}
	use {'lewis6991/gitsigns.nvim',
		config = function()
			require("gitsigns").setup()
		end
	}
	-- Build management
	use {'shatur/neovim-tasks',
		requires = {'nvim-lua/plenary.nvim','mfussenegger/nvim-dap'}
	}
	--NON-CRITICAL END

	if packer_bootstrap then
		require("packer").sync()
	end
end)
