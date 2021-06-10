# dotfiles

My personal dotfiles, originally for macOS only but currently being adapted for use on Linux based systems (Ubuntu and Pop!_OS in particular) where needed.

## Installation

```
git clone --bare git@github.com:opdavies/dotfiles.git $HOME/dotfiles
git --git-dir $HOME/dotfiles --work-tree $HOME checkout
git --git-dir $HOME/dotfiles --work-tree $HOME config status.showUntrackedFiles no
```

### Adding a `config` alias

You can also set a `config` alias as a wrapper for the Git command, as described within [Atlassian's blog post](https://www.atlassian.com/git/tutorials/dotfiles):

    alias config="git --git-dir $HOME/dotfiles --work-tree $HOME"

### Adding new files

```
config add /path/to/file
config commit -m "Some commit message"
config push
```

## Inspiration

- [Chris Toomey](https://github.com/christoomey/dotfiles)
- [Gabe Berke-Williams](https://github.com/gabebw/dotfiles)
- [Jeff Geerling](https://github.com/geerlingguy/dotfiles)
- [Robin Malfait](https://github.com/RobinMalfait/dotfiles)
- [Thoughtbot](https://github.com/thoughtbot/dotfiles)
