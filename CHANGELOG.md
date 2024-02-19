# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com), but adapted to work with trunk-based development and continuous delivery.

Instead of grouping changes by tag, they are grouped by the date they are released.

## 19th February 2024

### Added

* Add an i3 keybinding to open `thunar`.
* Set the default i3 workspace.

## 14th February 2024

### Changed

* Replace the custom `watch-changes` script with `watchexec` (https://github.com/watchexec/watchexec).
* Add `arandr`.

## 7th February 2024

### Changed

* Run NixOS garbage collection daily instead of weekly and delete generations older than 7 days.

## 4th February 2024

### Added

* Add `i3-auto-layout` to add automatic tiling.

### Removed

* Remove `i3-gaps`.

## 31st January 2024

### Changed

* Focus in i3 should no longer follows the mouse.
* Change colours in `dmenu`.

## 29th January 2024

### Changed

* Automatically ignore `todo` and `notes` files from Git.
* Change i3 colours.

## 26th January 2024

### Added

* Re-add Starship prompt.

### Changed

* Update `build-configs` aliases.

## 25th January 2024

### Added

* Re-add the Sharship prompt.
* Add `lazygit`.
* Add Geist Mono Nerd Font and use it in Alacritty.
* Add `rclone` and `rclone-browser`.

### Changed

* Don't list any directories ending with `-old` or `.old` when using the `t` function.
* zsh: rename `nah` alias to `reset`.
* zsh: remove autocompletion plugin.
* Install `fzf` using Home Manager.

### Fixed

* Only show the first level of directories in `~/Code/tmp` when using the `t` function.

## 24th January 2024

### Changed

* Extract my Neovim configuration to a separate repository - <https://github.com/opdavies/opdavies.nvim>.

## 17th January 2024

### Added

* nvim: add `<leader>gc` to run `:Git commit`.
* nvim: add PHP snippets for `__invoke()` and `__construct()` methods.

## 15th January 2024

### Added

* Add a keybinding for i3 to use `feh` to switch the wallpaper.

## 10th January 2024

### Added

* nvim: show trailing spaces.
* nvim: remove completion in command mode.

## 8th January 2024

### Added

* Add `blueman` for Bluetooth and `gscan2pdf` for scanning.

### Changed

* Don't use autocomplete in Vim's command mode.
* Making the NixOS hostname configurable from the Flake.

## 7th January 2024

### Added

* Add `feh` to automatically select a random wallpaper and link it with i3 and autorandr.
* Add Telescope keymaps to find the current word under the cursor within the open project.

## 4th January 2024

### Added

* Add CopyQ for clipboard management and Flameshot for screenshots.

## 3rd January 2024

### Added

* Add iamcco/markdown-preview.nvim to preview Markdown files within Neovim.

## 27th December 2023

### Added

* Add Dunst for notifications, including when the battery is low or fully charged.

## 21st December 2023

### Added

* Add `run` aliases to zsh.

### Changed

* Update Alacritty configuration.
* Change `splitbelow` to `false` in Neovim.

### Removed

* Remove the Starship prompt.

## 19th December 2023

### Fixed

* Fix terminal colours within tmux.

## 18th December 2023

### Added

* Add `prettier` as a formatter within Neovim.

## 17th December 2023

### Changed

* Update the Git commit message template, removing references to conventional commits.
* Open Harpoon window at the top of the screen.
* Manage `ripgrep` with Home Manager.

## 15th December 2023

### Added

* Add `:dotfiles` and `:website` matches to espanso.

### Changed

* Configure colours in `i3status` and remove some modules.

## 14th December 2023

### Added

* Add [espanso](https://espanso.org) as a text expander.

## 13th December 2023

### Changed

* Changed tmux border pane colours.

### Removed

* Remove `just` from the flake.

## 12th December 2023

### Added

* Add `Q` keymaps to easily re-run macros in Neovim.

### Changed

* Move `autorandr` configuration into its own Nix module.
* Change default i3 workspaces for Alacritty and VLC.
* Change back to the stable release of nixpkgs as Slack was broken.

### Removed

* Remove `terraform` from the flake.

## 9th December 2023

### Changed

* Use `zoxide` to provide paths in the `t` script.
* Upgrade to Harpoon 2.

## 7th December 2023

### Added

* Use `autorandr` for monitor management instead of custom bash scripts.

## 6th December 2023

### Added

* Re-add `GoToFile` command that starts Neovim with Telescope open.

### Changed

* Switched to nixpkgs unstable by default.

## 1st December 2023

### Changed

* Update nixpkgs to 23.11.

## 29th November 2023

### Changed

* Update PHP test method snippets and netrw in Neovim.

## 21st November 2023

### Added

* Add CHANGELOG.md.
* More i3 key mappings for navigating between and focusing windows, as well as volume and brightness control.

### Changed

* Updated Harpoon mappings.
* Make the monitor ID and mode configurable in `switch-to-laptop-screen` and `switch-to-monitor` scripts.

### Fixed

* Prevent `markdownlint` from showing errors for line lengths and duplicate non-sibling headings, making it easier to work with files, such as CHANGELOG.md, that contains the same headings multiple times.
