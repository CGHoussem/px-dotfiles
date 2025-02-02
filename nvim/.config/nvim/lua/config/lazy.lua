-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.get_char()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)


-- make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- this is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import custom plugins
		-- { import = "plugins" },
		{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
		{
			"nvim-treesitter/nvim-treesitter", name = "nvim-treesitter",
			build = ":TSUpdate",
			config = function ()
				local configs = require("nvim-treesitter.configs")

				configs.setup({
					ensure_installed = { "lua", "vim", "vimdoc", "python", "json", "yaml" },
					sync_install = false,
					highlight = { enable = true },
					indent = { enable = true },
				})
			end
		},
		{ "neovim/nvim-lspconfig", name="nvim-lspconfig" },
		-- nvim-cmp family; TODO needs more configuration setup
		{
			"hrsh7th/nvim-cmp" ,
			dependencies = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "hrsh7th/cmp-buffer" },
				{ "hrsh7th/cmp-path" },
				{ "hrsh7th/cmp-cmdline" },
			}
		},
		-- dashboard :)
		{
			"nvimdev/dashboard-nvim",
			event = "VimEnter",
			config = function()
				require("dashboard").setup {}
			end,
			dependencies = { {"nvim-tree/nvim-web-devicons"} }
		},
		-- telescope
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				{ "nvim-lua/plenary.nvim" },
				{ "BurntSushi/ripgrep" },
				{
					"nvim-telescope/telescope-fzf-native.nvim",
					build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
				},
			},
		},
	},
	-- configure any othert settings..
	-- colorscheme that will be used when installing plugins
	install = { colorscheme = { "catppuccin" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- usage of catppuccin
vim.cmd.colorscheme "catppuccin-mocha"

-- setup lsp config
local lspconfig = require("lspconfig")
lspconfig.pylsp.setup{}
lspconfig.lua_ls.setup{}  -- requires lua-language-server to be in $PATH
lspconfig.yamlls.setup{}

-- key mappings
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fn", builtin.help_tags, { desc = "Telescope helm tags" })
