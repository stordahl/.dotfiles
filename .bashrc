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

# ALIASES
# Vim 
alias vim="nvim"
alias vi="nvim"
alias v="nvim ."

#Tmux
alias t="bash ~/.scripts/tmux_switch_interactive.sh"
alias tn="bash ~/.scripts/tmux_create.sh"
alias td="tmux detach"
alias ta="tmux attach"
alias tl="tmux ls"
alias tkill="tmux kill-server"

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
alias gsync="gsw $(git remote show origin | sed -n '/HEAD branch/s/.*: //p') && yank"
alias yank="git pull"
alias yeet="git push"
alias yeet-hard="git push --force-with-lease"

# Utils
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

neofetch
