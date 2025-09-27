{
	symlinkJoin,
	neovim-unwrapped,
	makeWrapper,
	runCommandLocal,
	vimPlugins,
	lib,
}:
let
	packageName = "mypackage";

	# These are loaded on startup.
	startPlugins = with vimPlugins; [
		lz-n
		lzn-auto-require
	];

	# Optional plugins
	optPlugins = with vimPlugins; [
		nightfly
		telescope-nvim
		nvim-treesitter.withAllGrammars
		neo-tree-nvim
		bufferline-nvim
	];

	foldPlugins = builtins.foldl' (
		acc: next:
			acc
			++ [
				next
			]
			++ (foldPlugins (next.dependencies or []))
		) [];

	startPluginsWithDeps = lib.unique (foldPlugins startPlugins);
	optPluginsWithDeps = lib.unique (foldPlugins optPlugins);

	packpath = runCommandLocal "packpath" {} ''
		mkdir -p $out/pack/${packageName}/{start,opt}

		ln -vsfT ${./retoran-conf} $out/pack/${packageName}/start/retoran-conf

		${
		lib.concatMapStringsSep
		"\n"
		(plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/start/${lib.getName plugin}")
		startPluginsWithDeps
	}
		${
		lib.concatMapStringsSep
		"\n"
		(plugin: "ln -vsfT ${plugin} $out/pack/${packageName}/opt/${lib.getName plugin}")
		optPluginsWithDeps
	}
	'';
in
	symlinkJoin {
		name = "neovim-retoran";
		paths = [neovim-unwrapped];
		nativeBuildInputs = [makeWrapper];
		postBuild = ''
			wrapProgram $out/bin/nvim \
			--add-flags '-u' \
			--add-flags 'NORC' \
			--add-flags '--cmd' \
			--add-flags "'set packpath^=${packpath} | set runtimepath^=${packpath}'" \
			--set-default NVIM_APPNAME nvim-retoran
		'';
		passthru = {
			inherit packpath;
		};
	}
