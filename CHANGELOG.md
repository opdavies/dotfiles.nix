# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com), but adapted to work with trunk-based development and continuous delivery.

Instead of grouping changes by tag, they are grouped by the date they are released.

## 11th June 2024

### Changed

- Switch to `firefox-wayland`.
- Updated background colour in the tmux status bar.
- Switch from NixOS unstable to 24.05.

## 10th June 2024

### Updated

- Update `opdavies.nvim` to the latest version.

### Changed

- Format code in `flake.nix` and `lib` with the new `nixfmt-rfc-style`.

## 9th June 2024

### Changed

- Set the `systemd-boot` configuration limit to 10.
- Refactor zsh configuration.
  - Use <https://github.com/MenkeTechnologies/zsh-expand> for expanding ZSH aliases instead of custom code.
  - Use `programs.zsh.shellAliases` and `programs.zsh.shellGlobalAliases` for declaring aliases instead of `programs.zsh.initExtra`.
- Tweak battery and performance settings.
- Change the date format used in `i3status-rs`.

### Removed

- Remove the `starship` prompt.

### Updated

- Update flake lock dependencies.

## 6th June 2024

### Updated

- Update flake lock dependencies.

## 2nd July 2024

### Added

- Re-add the `starship` prompt.

## 1st July 2024

### Updated

- Update flake lock dependencies.

## 31st May 2024

### Added

- Add keybindings to increase and decrease the volume in `mpv`.
- Add `mpv`.

### Removed

- Remove `vlc`.

### Changed

- Add `wezterm` as my default terminal to see how it compares to Alacritty.
- Rename `kanshi.profiles` to `kanshi.settings` as `kanshi.settings` is deprecated.

### Updated

- Update flake lock dependencies

## 24th May 2024

### Added

- Add `wezterm`.

## 23rd May 2024

### Added

- Add `simple-http-server`.

## 22nd May 2024

### Added

- Add GNOME as a desktop manager, working with Wayland and Sway.
- Add `vss` as an alias for sorting words in my Vim spellfile (`~/Code/personal/opdavies.nvim/spell/en.utf-8.add`).

### Updated

- Update flake lock dependencies.

### Changed

- Move Slack from Home Manager to the NixOS configuration.
- Add `build-configs` from its derivation.

## 20th May 2024

### Added

- Add `swaybg`.

### Changed

- Remove Git aliases I wasn't using and move the `update` ZSH alias to be `git update`.

### Updated

- Update flake lock dependencies.

## 19th May 2024

### Updated

- Update `kdenlive` and remove references to nixpkgs 23.11.
- Update flake lock dependencies.

## 15th May 2024

### Added

- Alias `cat` to `bat`.

## 12th May 2024

### Added

- Add a `todo` function to append to a `TODO.txt` file.
- Add a `til` function to append to a `TIL.txt` file.

### Changed

- Don't automatically run tmuxinator when starting a `tmux` session.

### Updated

- Update flake lock dependencies.

## 11th May 2024

### Changed

- Open `pavucontrol` and `copyq` in a floating window.
- Configure `lsd`.

## 10th May 2024

### Added

- Add `update-all-git-repos` script to update top-level Git repositories to their latest versions.
- Add `just` globally.

## 9th May 2024

### Added

- Add the `git root` command to navigate to or execute commands at the root of a Git repository.
- Add `yt-dlp`.
- Add `ttyper` and set some default values.

### Changed

- Use `.ignored/justfile` if it exists when running `just` commands.
- Update monitor resolution in `kanshi`.
- Move some desktop-specific packages to the desktop list.
- Allow passing arguments to the `just nixos-*` commands.

### Fixed

- Fix colours in `tmux` and copying to the system clipboard.

### Updated

- Update flake lock dependencies.

### Removed

- Remove references to `autotiling`, as it's no longer used.

## 7th May 2024

### Changed

- Update sway configuration.

### Updated

- Update flake lock dependencies.

## 6th May 2024

### Changed

- Replace periods with underscores in tmux session names.

### Updated

- Update flake lock dependencies.

## 5th May 2024

### Changed

- Change background colours in the sway bar.
- Source a `~/.tmux.conf.local` file, if it exists.

### Fixed

- Include the `zsh-fzf-history-search` plugin within `.zshrc`.

### 4th May 2024

### Changed

- Move `bin` into my `~/.local` directory.
- Add directories within `~/Code/personal`, `~/Code/work` and `/tmp` when fuzzy-finding directories for tmux sessions.
- Set the default workspace in `sway`.
- Stop automatically assigning apps to workspaces.

### Removed

- Remove `starship`.

### Updated

- Update lock file dependencies.

## 3rd May 2024

### Changed

- Simplify the directory structure within `bin/t`.

## 2nd May 2024

### Added

- Add `syncthing` as a service.

### Changed

- Make `Prefix-W` create a new tmux session in the wiki directory.

### Updated

- Update flake lock dependencies.

## 30th April 2024

### Fixed

- Automatically run `kanshi` when reloading sway so the resolution is correct.
- Allow for firewall connections to xdebug.

### Updated

- Update flake lock dependencies.

## 25th April 2024

### Added

- Add `ddev` and `mkcert`.

## 23rd April 2024

### Added

- Add scripts to easily start and stop Traefik.

### Changed

- Move `~/.config/bin` to `~/bin`.

## 19th April 2024

### Changed

- Use `fzf` for searching ZSH history.

## 18th April 2024

### Updated

- Update flake lock dependencies.

## 17th April 2024

### Added

- Make `clone` work with HTTPS URLs.
- Add a `$REPOS` environment variable that links to my code repository directory (`~/Code`).

### Fixed

- Update Bitbucket URLs within the `clone` function.

### Updated

- Update flake lock dependencies.

## 16th April 2024

### Added

- Add a `clone` function for cloning Git repositories into the correct directory based on service provider and organisation name.

## 8th April 2024

### Changed

- Move `wsl2-*` commands to justfile.

### Updated

- Update flake lock dependencies.

## 7th April 2024

### Added

- Add `atuin` for searching shell history.

### Updated

- Update flake lock dependencies.

## 4th April 2024

### Updated

- Update `opdavies.nvim` to the latest version.

## 3rd April 2024

### Changed

- Enable smart gaps in sway.

## 1st April 2024

### Changed

- Remove support for `.tmuxinator.yml` files in `bin/t`.

## 31st March 2024

### Added

- Re-add autotiling with sway.

### Changed

- Use MesloLGSDZ Nerd Font Mono as the default monospace font.

### Updated

- Update `opdavies.nvim` to the latest version.

---

## 30th March 2024

### Added

- Add a keybinding to open Thunar.
- Add support for `.tmuxinator.yaml` files to `bin/t`.

### Changed

- Switch `awscli2` back to unstable.
- Replace `.tmux` with `tmuxinator`.

## 29th March 2024

### Changed

- Remove flake parts from `flake.nix`.

## 26th March 2024

### Added

- Add `tmuxinator`.

### Changed

- Use a `.ignored/.tmuxinator.yml` file, if it exists.
- Simplify `nixos-*` recipes in `justfile`.
- Configure gtk.

### Updated

- Update `opdavies.nvim` to the latest version.

## 25th March 2024

### Changed

- Switch back to Wayland and Sway.
- Format with `nixfmt`.

### Fixed

- Fix `awscli2` build error.

### Updated

- Update flake lock dependencies.

## 22nd March 2024

### Added

- Re-add `autotiling`.

### Changed

- Enable floating windows by default for Zoom.
- Replace `watchexec` with `entr`.

## 20th March 2024

### Removed

* Remove `Mod+Tab` keybinding from the i3 configuration so that it no longer toggles the previous workspace.

## 18th March 2024

### Changed

* Update autorandr configuration.
* Automatically prune unused Docker images on a weekly basis.

## 14th March 2024

### Added

- Add Pocket Casts, Spotify, Microsoft Teams, and Todoist.

## 12th March 2024

### Removed

* Remove lazygit from my Git configuration file.

### Changed

* Use a different email address for Git when working in a TfW codebase.

## 9th March 2024

### Fixed

* Fix error in Kdenlive when rendering a project by pinning it to the nixpkgs 23.11 release.
* Add `udev` rules via VIA/Vial which allow for more reliably accessing the keyboard, which was previously inconsistent and only seemed to work straight away after booting.

## 1st March 2024

### Added

* Add `cachix` for Nix binary caching (to be configured).

### Changed

* Git configuration changes after watching Scott Chacon's FOSDEM talk.

## 27th February 2024

### Added

* Add `bitwarden-cli`.

## 26th February 2024

### Added

* Add PHP 8.2 as a default global version.

## 24th February 2024

### Removed

* Remove `i3-auto-layout`.

## 19th February 2024

### Added

* Add an i3 keybinding to open `thunar`.
* Set the default i3 workspace.

### Changed

* Use `rofi` instead of `dmenu`.

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
