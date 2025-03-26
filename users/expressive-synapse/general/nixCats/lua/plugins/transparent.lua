return {

	{
		"xiyaowong/transparent.nvim",
		require("transparent").setup({
			extra_groups = {
				"LineNr",
				"LineNrAbove",
				"LineNrBelow",
			},
			exclude_groups = {},
		}),
	},
}
