local state = require("present.state")
local slides = require("present.slides")
local window = require("present.window")

local M = {}

local next = function()
	state.current_slide = math.min(state.current_slide + 1, #state.parsed.slides)
	slides.set_slide_content(state.current_slide)
end

local previous = function()
	state.current_slide = math.max(state.current_slide - 1, 1)
	slides.set_slide_content(state.current_slide)
end

local quit = function()
	vim.api.nvim_win_close(state.floats.body.win, true)
end

local execute_block = function()
	local slide = state.parsed.slides[state.current_slide]

	local block = slide.blocks[1]
	if not block then
		print("No blocks on this page")
		return
	end

	-- Override the default print function, to capture all of the output
	-- Store the original print function
	local original_print = print
	-- Table to capture print messages
	local output = { "", "# Code", "", "```" .. block.language }
	vim.list_extend(output, vim.split(block.body, "\n"))
	table.insert(output, "```")

	-- Redefine the print function
	print = function(...)
		local args = { ... }
		local message = table.concat(vim.tbl_map(tostring, args), "\t")
		table.insert(output, message)
	end

	-- Call the provided function
	local chunk = loadstring(block.body)
	pcall(function()
		table.insert(output, "")
		table.insert(output, "# Output ")
		table.insert(output, "")
		if not chunk then
			table.insert(output, " <<<BROKEN CODE>>>")
		else
			chunk()
		end
	end)

	-- Restore the original print function
	print = original_print
	local buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
	local temp_width = math.floor(vim.o.columns * 0.8)
	local temp_height = math.floor(vim.o.lines * 0.8)
	vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		style = "minimal",
		noautocmd = true,
		width = temp_width,
		height = temp_height,
		row = math.floor((vim.o.lines - temp_height) / 2),
		col = math.floor((vim.o.columns - temp_width) / 2),
		border = "rounded",
	})
	vim.bo[buf].filetype = "markdown"
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
end

M.configure_slide_buffer = function(win)
	local buf = win.buf

	assert(buf, "Must have a slide buffer")

	vim.bo[buf].filetype = "markdown"
	vim.bo[buf].buftype = "nofile"
	vim.bo[buf].bufhidden = "wipe"
	vim.bo[buf].modifiable = false

	local restore = {
		cmdheight = {
			original = vim.o.cmdheight,
			present = 0,
		},
	}

	-- Set the options we want during presentation
	for option, config in pairs(restore) do
		vim.opt[option] = config.present
	end

	vim.api.nvim_create_autocmd("BufLeave", {
		buffer = state.floats.body.buf,
		callback = function()
			-- Reset the values when we are done with the presentation
			for option, config in pairs(restore) do
				vim.opt[option] = config.original
			end

			window.foreach_float(function(_, float)
				pcall(vim.api.nvim_win_close, float.win, true)
			end)
		end,
	})

	vim.api.nvim_create_autocmd("VimResized", {
		group = vim.api.nvim_create_augroup("present-resized", {}),
		callback = function()
			if not vim.api.nvim_win_is_valid(state.floats.body.win) or state.floats.body.win == nil then
				return
			end

			local updated = window.create_window_configurations()

			window.foreach_float(function(name, _)
				vim.api.nvim_win_set_config(state.floats[name].win, updated[name])
			end)

			slides.set_slide_content(state.current_slide)
		end,
	})

	local keybindings = {
		n = next,
		p = previous,
		q = quit,
		X = execute_block,
	}

	for key, func in pairs(keybindings) do
		vim.keymap.set("n", key, func, { buffer = state.floats.body.buf })
	end
end

return M
