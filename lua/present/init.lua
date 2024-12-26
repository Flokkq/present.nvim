local state = require("present.state")
local window = require("present.window")
local slides = require("present.slides")
local commands = require("present.commands")

local M = {}

M.setup = function()
	-- nothing
end

-- Reusable function to initialize the presentation environment
local function initialize_presentation(parsed_slides, title)
	state.parsed = parsed_slides
	state.current_slide = 1
	state.title = title

	local windows = window.create_window_configurations()
	state.floats.background = window.create_floating_window(windows.background)
	state.floats.header = window.create_floating_window(windows.header)
	state.floats.body = window.create_floating_window(windows.body, true)
	state.floats.footer = window.create_floating_window(windows.footer)

	window.foreach_float(function(_, float)
		commands.configure_slide_buffer(float)
	end)

	slides.set_slide_content(state.current_slide)
end

M.start_presentation = function(opts)
	opts = opts or {}
	opts.bufnr = opts.bufnr or 0

	state.active = true

	local lines = vim.api.nvim_buf_get_lines(opts.bufnr, 0, -1, false)
	local parsed_slides = slides.parse(lines)
	local title = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(opts.bufnr), ":t")

	initialize_presentation(parsed_slides, title)
end

M.show_help = function()
	commands.show_help(initialize_presentation)
end

M._parse_slides = slides.parse

return M
