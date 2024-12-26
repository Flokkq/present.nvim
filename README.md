# `present.nvim`

A minimalist Neovim plugin for presenting markdown slides. Make sure to 

## Setup

Add the following configuration to use `present.nvim`. Use these keybindings during your presentation:

| Key |    Description                         |
|------|---------------------------------------|
| `n`   | Move to the next slide             |
| `p`   | Move to the previous slide         |
| `q`   | Quit the presentation              |
| `X`   | Execute the first code block       |
| `?` |   Show all available keybindings     |

## Installation with Lazy.nvim

To install `present.nvim` using [Lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "flokkq/present.nvim",
  version = "*", -- Or specify a semver like "v1.0.0"
}
```
That's it! Start presenting with `:PresentStart`.
