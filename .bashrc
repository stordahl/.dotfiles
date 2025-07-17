if [[ -n $PS1 && -f ~/.bash_prompt ]]; then
  . ~/.bash_prompt
  ps1_colorful_theme
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  source ~/.bash_linux
  source ~/.bash_linux_private
elif [[ "$OSTYPE" == "darwin"* ]]; then
  source ~/.bash_macos
  source ~/.bash_macos_private
fi

# completion
# [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"

# vim mode
set -o vi

# ALIASES
# Vim 
alias vim="nvim"
alias v="nvim" 

#Tmux
alias t="bash ~/.scripts/tmux_switch_interactive.sh"
alias tn="bash ~/.scripts/tmux_create.sh"
alias td="tmux detach"
alias tk="bash ~/.scripts/tmux_kill_interactive.sh"

# Git
alias g="git"
alias gs="git status"
alias gc="git add . && git commit -m"
alias gsw="~/.scripts/git_switch_interactive.sh"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gb="git for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"
alias gd="git diff"
alias gaa="git add ."
alias gr="git restore ."
alias yank="git pull"
alias yeet="git push"
alias yeet-hard="git push --force-with-lease"
alias lg="lazygit"

# Utils
alias ss="~/.scripts/search_history.sh"
alias ..="cd ../"
alias ...="cd ../.."
# Use bat instead of cat
alias cat="bat"
# Search with fzf and open in nvim
alias ff="fd --type f --hidden --exclude .git | fzf --preview 'bat --color=always {1}' | xargs nvim"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# suppress macos warning about zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export VOLTA_FEATURE_PNPM="1"
. "$HOME/.cargo/env"
. "/Users/stordahl/.deno/env"


. "$HOME/.atuin/bin/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

# opencode
export EDITOR=nvim
export PATH=/Users/stordahl/.opencode/bin:$PATH
