local state = require("present.state")

local M = {}

M.create_floating_window = function(config, enter)
	local buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	local win = vim.api.nvim_open_win(buf, enter or false, config)

	return { buf = buf, win = win }
end

M.foreach_float = function(cb)
	for name, float in pairs(state.floats) do
		cb(name, float)
	end
end

M.create_window_configurations = function()
	local width = vim.o.columns
	local height = vim.o.lines

	local header_height = 1 + 2
	local footer_height = 1
	local body_height = height - header_height - footer_height - 2 - 1

	return {
		background = {
			relative = "editor",
			width = width,
			height = height,
			style = "minimal",
			col = 0,
			row = 0,
			zindex = 1,
		},
		header = {
			relative = "editor",
			width = width,
			height = 1,
			style = "minimal",
			border = "rounded",
			col = 0,
			row = 0,
			zindex = 2,
		},
		body = {
			relative = "editor",
			width = width - 8,
			height = body_height,
			style = "minimal",
			border = { " ", " ", " ", " ", " ", " ", " ", " " },
			col = 8,
			row = 4,
		},
		footer = {
			relative = "editor",
			width = width,
			height = 1,
			style = "minimal",
			col = 0,
			row = height - 1,
			zindex = 2,
		},
	}
end

return M
