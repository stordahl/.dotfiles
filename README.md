# .dotfiles

<img src="https://i.pinimg.com/originals/cd/6f/24/cd6f240d6467e74b1452991a638adf99.gif" />

zsh, brew, nvim, hammerspoon, tmux, shell scripts, etc

## System Prerequisites
- OS: macOS arm (M1)
- Package Mgmt: [Homebrew](https://brew.sh)
- Shell: zsh

## Installation

### zsh

Install [oh-my-zsh](https://ohmyz.sh/) and place `.zshrc` in your home dir 

### brew

Place `Brewfile` in your home dir, and run

```shell
brew bundle install
```

### neovim

Install [Packer](https://github.com/wbthomason/packer.nvim#quickstart) for package mgmt inside nvim. Place `.config/nvim` in your home dir.

Launch neovim with `nvim` and run `:PackerInstall` & `:PackerCompile`
