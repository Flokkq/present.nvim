---@class present.Slides
---@field slides present.Slide[]: The slides of the file

---@class present.Slide
---@field title string: The title of the slide
---@field body string[]: The body of slide
---@field blocks present.Block[]: A codeblock inside of a slide

---@class present.Block
---@field language string: The language of the codeblock
---@field body string: The body of the codeblock

---@class present.State
---@field current_slide number The index of the current slide
---@field title string The title of the presentation
---@field parsed present.Slides The parsed slides of the presentation
---@field floats table<string, { buf: number, win: number }> A table containing the floating window buffers and windows
