# Emacs Configuration Overview

This `init.el` provides a focused, Vim-like Emacs experience, optimized for speed, navigation, visual clarity, and extensibility. Below you'll find the key features and commands enabled by this configuration.

## Startup Behavior

- **Disables UI clutter**: no toolbar, menubar, scrollbar, or tooltips.
- **Enables**: relative line numbers, column numbers, fringe spacing.
- **Theme**: `doom-palenight` via `doom-themes` (fallback: `wombat`).
- **Font**: `"MesloLGS NF"` at size 120.

---

## Core Navigation & Editing

### Evil Mode (Vim emulation)
- Enabled by default.
- Uses `visual-line-mode`-style motions:
  - `j`, `k` move visually
  - `C-g`: return to normal state
  - `C-h`: delete char backward and join

### Leader Key (`SPC`)
Custom commands with `SPC` prefix, defined via `general.el`:

| Command              | Description                     |
|----------------------|---------------------------------|
| `SPC t t`            | Load a theme with `counsel`     |
| `SPC t s`            | Scale text interactively (Hydra)|

---

## Searching and Navigation

### Ivy + Counsel + Swiper

| Keybinding           | Description                          |
|----------------------|--------------------------------------|
| `C-s`                | Search with `swiper`                 |
| `C-M-j`              | Switch buffer with `counsel`         |
| `C-r` (in minibuffer)| Show history                         |
| `TAB`, `C-l`         | Accept minibuffer candidates         |
| `C-j`, `C-k`         | Navigate candidates                  |

### Marginalia

Adds annotations in minibuffer completions (e.g., file types, commands).

---

## Projects

Built-in `project.el` support:
- `C-x p` — access project commands

---

## UI Enhancements

- `doom-modeline`: clean, modern modeline
- `all-the-icons`: file and UI icons
- `which-key`: popup showing possible keybindings
- `rainbow-delimiters`: nested parentheses highlighting in code

---

## Dev Tools

### Git Integration: `magit`
| Keybinding           | Description                 |
|----------------------|-----------------------------|
| `C-x g`              | Open `magit-status`         |
| `?` (inside Magit)   | Help menu                   |
| `C-c` (inside Magit) | Access actions              |

---

## Updating Packages

To update all installed packages, run:
`M-x package-upgrade-all`

This will fetch the latest versions from the configured package archives (`melpa`, `org`, and `elpa`) and upgrade the installed packages.

---

## Packages and Setup

- Configured to automatically install all packages using `use-package`
- Packages from `melpa`, `elpa`, and `org` archives
- Customizations are saved in a separate file: `custom.el`

---

## Custom Text Scaling (Hydra)
Interactive command to increase or decrease text scale:

| Command              | Description                     |
|----------------------|---------------------------------|
| `SPC t s`            | Open text scale hydra           |
| `j` / `k`            | Increase / decrease font size   |
| `f`                  | Finish                          |

---

## Modes with Line Numbers Disabled

Line numbers are turned **off** for the following modes:

- `org-mode`
- `term-mode`
- `shell-mode`
- `treemacs-mode`
- `eshell-mode`

---

## Notes

- To install required fonts for icons:
  - `M-x all-the-icons-install-fonts`
  - `M-x nerd-icons-install-fonts` (if needed)
- To switch themes: `SPC t t`
