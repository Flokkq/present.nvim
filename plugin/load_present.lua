vim.api.nvim_create_user_command("PresentStart", function()
	require("present").start_presentation() -- lazy loaded by default
end, {})

vim.api.nvim_create_user_command("PresentHelp", function()
	require("present.state").active = false -- Ensure standalone mode
	require("present.commands").show_help()
end, {})
