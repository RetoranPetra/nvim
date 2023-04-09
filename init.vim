lua << EOF
	--[[
	-- Error checking for loading "plugins"
	local ok, plug = pcall(require,'plugins')
	if not ok then 
		print("Plugins had an error!")
	else
		plug.function()
	end
	local ok, pref = pcall(require,'preferences')
	if not ok then
		print("Preferences had an error!")
	else
		pref.function()
	end
	--]]
	--package.loaded['plugins'] = nil
	require('plugins')
	--package.loaded['preferences'] = nil
	require('preferences')

	--print("All loaded successfully!")
EOF

"Unify clipboard
set clipboard+=unnamed 	"use clipboards of vim and win
set paste "paste from a windows or vim

"Change nvim copy/paste to use system copy/paste
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>Y "+Y

vnoremap <C-S-c> "*y
vnoremap <C-S-v> "*p
