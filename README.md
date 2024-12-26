# `present.nvim`

A minimalist Neovim plugin for presenting markdown slides. You can start presenting with `:PresentStart`.

## Setup

Add the following configuration to use `present.nvim`. Use these keybindings during your presentation:

| Key |    Description                         |
|------|---------------------------------------|
| `n`   | Move to the next slide             |
| `p`   | Move to the previous slide         |
| `q`   | Quit the presentation              |
| `X`   | Execute the first code block       |
| `?` |   Show all available keybindings     |

### Installation using [Lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "flokkq/present.nvim",
  version = "v0.1.0", 
}
```

### Installation using [Packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "flokkq/present.nvim",
  tag = "v0.1.0",
}
```

### Installation using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'flokkq/present.nvim'
```
