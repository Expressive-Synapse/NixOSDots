return {

	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			--[[
			require("mini.base16").setup({
				palette = {
					base00 = string.format("#%s", nixCats("stylix.base00")),
					base01 = string.format("#%s", nixCats("stylix.base01")),
					base02 = string.format("#%s", nixCats("stylix.base02")),
					base03 = string.format("#%s", nixCats("stylix.base03")),
					base04 = string.format("#%s", nixCats("stylix.base04")),
					base05 = string.format("#%s", nixCats("stylix.base05")),
					base06 = string.format("#%s", nixCats("stylix.base06")),
					base07 = string.format("#%s", nixCats("stylix.base07")),
					base08 = string.format("#%s", nixCats("stylix.base08")),
					base09 = string.format("#%s", nixCats("stylix.base09")),
					base0A = string.format("#%s", nixCats("stylix.base0A")),
					base0B = string.format("#%s", nixCats("stylix.base0B")),
					base0C = string.format("#%s", nixCats("stylix.base0C")),
					base0D = string.format("#%s", nixCats("stylix.base0D")),
					base0E = string.format("#%s", nixCats("stylix.base0E")),
					base0F = string.format("#%s", nixCats("stylix.base0F")),
				},
			})
			]]
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()
			--[[
			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
			]]

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
}
