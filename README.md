# dotfiles

My personal dotfiles, originally for macOS only but currently being adapted for
use on Linux based systems (Ubuntu and Pop!_OS in particular) where needed.

The repository is powered using Ansible, with each software package and its
associated configuration within separate roles within the `roles` directory.

The `neovim` role, for example, has its own tasks in `roles/neovim/tasks/main.yaml`
and files in `roles/neovim/files`.

Files within a role are typically symlinked into their required destination
so that they will be automatically updated without needing to run the playbook
again.

For example, the files and directories within the neovim role are symlinked
into `~/.config/nvim`.

## Requirements

- [Ansible](https://www.ansible.com)
- [Git](https://git-scm.com)

## Installation

```
$ ansible-playbook main.yaml --ask-become-pass
```

## Inspiration

- [Chris Toomey](https://github.com/christoomey/dotfiles)
- [Gabe Berke-Williams](https://github.com/gabebw/dotfiles)
- [Jeff Geerling](https://github.com/geerlingguy/dotfiles)
- [Robin Malfait](https://github.com/RobinMalfait/dotfiles)
- [TJ DeVries](https://github.com/tjdevries/config_manager)
- [TheAltF4Stream](https://github.com/ALT-F4-LLC/dotfiles)
- [ThePrimeagen](https://github.com/ThePrimeagen/.dotfiles)
- [Thoughtbot](https://github.com/thoughtbot/dotfiles)
- [codico](https://github.com/codicocodes/dotfiles)
