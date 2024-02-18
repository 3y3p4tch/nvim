return {
	ensure_installed = {
		'bash',
		'c',
		'cpp',
		'python',
		'rust',
		-- vim related languages
		'lua', 'vim', 'vimdoc',
		-- treesitter query language
		'query'
	},
	sync_install = false,
	highlight = {
		enable = true,
	},
}
