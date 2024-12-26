local state = require("present.state")
local window = require("present.window")

local M = {}

--- Takes some lines and parses them
---@param lines string[]: The lines in the buffer
---@return present.Slides
M.parse = function(lines)
	local slides = { slides = {} }
	local current_slide = {
		title = "",
		body = {},
		blocks = {},
	}

	local separator = "^#"

	for _, line in ipairs(lines) do
		if line:find(separator) then
			if #current_slide.title > 0 then
				table.insert(slides.slides, current_slide)
			end

			current_slide = {
				title = line,
				body = {},
				blocks = {},
			}
		else
			table.insert(current_slide.body, line)
		end
	end

	table.insert(slides.slides, current_slide)

	for _, slide in ipairs(slides.slides) do
		local block = {
			language = nil,
			body = "",
		}
		local inside_block = false
		for _, line in ipairs(slide.body) do
			if vim.startswith(line, "```") then
				if not inside_block then
					inside_block = true
					block.language = string.sub(line, 4)
				else
					inside_block = false
					block.body = vim.trim(block.body)
					table.insert(slide.blocks, block)
				end
			else
				-- OK, we are inside of a current markdown block
				-- but it is not one of the guards.
				-- so insert this text
				if inside_block then
					block.body = block.body .. line .. "\n"
				end
			end
		end
	end

	return slides
end

M.set_slide_content = function(idx)
	local width = vim.o.columns

	local slide = state.parsed.slides[idx]

	local padding = string.rep(" ", (width - #slide.title) / 2)
	local title = padding .. slide.title
	local footer = string.format(" %s / %d | %s", "#" .. state.current_slide, #state.parsed.slides, state.title)

	window.foreach_float(function(_, float)
		vim.bo[float.buf].modifiable = true
	end)

	vim.api.nvim_buf_set_lines(state.floats.header.buf, 0, -1, false, { title })
	vim.api.nvim_buf_set_lines(state.floats.body.buf, 0, -1, false, slide.body)
	vim.api.nvim_buf_set_lines(state.floats.footer.buf, 0, -1, false, { footer })

	window.foreach_float(function(_, float)
		vim.bo[float.buf].modifiable = false
	end)
end

return M
