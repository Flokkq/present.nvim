---@type present.State
local M = {
	current_slide = 1,
	title = "",
	parsed = { slides = {} },
	floats = {},
	active = false,
}

return M
