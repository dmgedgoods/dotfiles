return {
	'saghen/blink.cmp',
	dependencies = {
		'rafamadriz/friendly-snippets',
	},
	version = '*',
	config = function()
		require('blink.cmp').setup({
			keymap = {
			},
		})
	end,
}
