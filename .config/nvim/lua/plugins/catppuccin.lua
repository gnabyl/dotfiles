return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		notify = false,
		which_key = false,
		mini = {
			enabled = true,
			indentscope_color = "",
		},
	},
	config = function()
		vim.cmd.colorscheme "catppuccin"
	end
}
