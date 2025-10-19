return {
	"github/copilot.vim",
	config = function()
		--setup keymap for completion to alt + f
		vim.g.copilot_no_tab_map = true
		vim.keymap.set("i", "<A-f>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
	end,
}
