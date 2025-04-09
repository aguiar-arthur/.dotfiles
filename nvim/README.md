# Neovim Configuration - nvim-v2

## Overview
Welcome to **nvim-v2**, a cleaner and more optimized Neovim configuration. This setup leverages the best plugins and practices for an efficient coding environment.

## Features
- **Lazy Loading**: Plugins are loaded only when needed to improve startup time.
- **LSP Support**: Comprehensive language server support with `nvim-lspconfig` and `mason.nvim`.
- **Beautiful UI**: Using `catppuccin` theme and `lualine` for an aesthetic look.
- **Advanced Search**: Powered by `telescope` for fuzzy finding and searching.
- **Version Control**: Git integration with `vim-fugitive` and `gitsigns.nvim`.
- **Code Formatting**: Configured with `null-ls.nvim` for linting and formatting.

## Installation
To install this configuration, clone the repository and place the files in your Neovim configuration directory (usually `~/.config/nvim`). Ensure you have the following dependencies installed:

- Neovim >= 0.9.0
- Git
- A terminal with support for True Colors

## Keymaps
The following keymaps are defined in this configuration:

### General Keymaps
- `<leader>`: Spacebar is used as the leader key.
- `<Esc>`: Clears search highlighting.

### Navigation
- `<C-d>`: Scroll half a page down and center.
- `<C-u>`: Scroll half a page up and center.
- `<C-k>`: Next item in the quickfix list.
- `<C-j>`: Previous item in the quickfix list.

### Editing
- `J`: Join lines without moving the cursor.
- `<leader>p`: Paste in visual mode without overwriting the unnamed register.
- `<leader>y`: Yank to the system clipboard.
- `<leader>d`: Delete without yanking.
- `<leader>s`: Search and replace the current word.
- `<leader>x`: Make the current file executable.

### Visual Mode Keymaps
- `J`: Move selected lines down.
- `K`: Move selected lines up.

### Telescope Keymaps
- `<leader>sh`: Search help tags.
- `<leader>sk`: Search keymaps.
- `<leader>sf`: Search files.
- `<leader>ss`: Open Telescope menu.
- `<leader>sw`: Search the current word.
- `<leader>sg`: Live grep.
- `<leader>sd`: Search diagnostics.
- `<leader>sr`: Resume last search.
- `<leader>s.`: Search recent files.
- `<leader><leader>`: Find existing buffers.
- `<leader>/`: Fuzzy search in the current buffer.
- `<leader>s/`: Live grep in open files.
- `<leader>sn`: Search Neovim configuration files.
- `<space>fb`: Open Telescope file browser.
  - `<A-c>`: Create a new file or folder.
  - `<A-r>`: Rename a file or folder.
  - `<A-d>`: Delete a file or folder.
  - `<C-h>`: Toggle hidden files.
  - `c`: Create a file or folder in normal mode.
  - `r`: Rename a file or folder in normal mode.
  - `d`: Delete a file or folder in normal mode.
  - `h`: Toggle hidden files in normal mode.

### Diagnostics Keymaps
- `[d`: Go to the previous diagnostic message.
- `]d`: Go to the next diagnostic message.
- `<leader>e`: Show diagnostic messages.
- `<leader>q`: Open the diagnostic quickfix list.

## Plugins

### Plugin Management
This configuration uses [lazy.nvim](https://github.com/folke/lazy.nvim) for managing plugins. The plugins are defined in the `plugins` directory and loaded dynamically.

### Core Plugins
- **LSP and Tools**: `nvim-lspconfig`, `mason.nvim`, `fidget.nvim`
- **UI Enhancements**: `catppuccin/nvim`, `lualine.nvim`
- **Search**: `nvim-telescope/telescope.nvim`, `telescope-ui-select.nvim`
- **Git**: `vim-fugitive`, `gitsigns.nvim`
- **Syntax Highlighting**: `nvim-treesitter/nvim-treesitter`
- **Formatting and Linting**: `none-ls.nvim`, `stylua`, `prettier`
- **Snippets**: `LuaSnip`, `friendly-snippets`

## Customization
Feel free to customize the configuration by adding or modifying plugins and settings in the `init.lua` or `plugins` directory. Use the `lazy.nvim` documentation for guidance on adding plugins.

## License
This configuration is released under the MIT License. See the `LICENSE` file for more information.

