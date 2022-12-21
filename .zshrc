# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Puppeteer
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export CYPRESS_CSS="local"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Plugins
plugins=( zsh-autosuggestions )

# Aliases
  # Vim 
  alias vim="nvim"
  alias vi="nvim"
	alias v="nvim ."
  # Resources
  alias kill8080="kill -9 $(lsof -t -i:'8080')"
  alias kill3000="kill -9 $(lsof -t -i:'3000')"
  # Utils
		# Print File Tree 
  	alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
		# Search with fzf and open in nvim
		alias ff="fd --type f --hidden --exclude .git | fzf --preview 'bat --color=always {1}' | xargs nvim"
		# Copy line of code to clipboard
		alias copy="ag . | fzf --delimiter ':' --preview 'bat --color=always --highlight-line {2} {1}' | awk -F ':' '{ print $3}' | sed 's/^\s+//' | pbcopy"
		# Use bat instead of cat
		alias cat="bat"
		# Custom cht.sh tool
		alias cht="bash ~/.scripts/cht.sh"
  # Git
  alias g="git"
  alias gs="git status"
	alias gc="git add . && git commit -m"
  alias gl="git log --oneline"
	alias gb="git for-each-ref --sort=committerdate refs/heads/ --format='%(committerdate:short) %(refname:short)'"
	alias gd="git diff"
	alias gcc="bash ~/.scripts/conv_commits.sh"
  alias yank="git pull"
  alias yeet="git push"
	# Github CLI
	alias dash="gh dash"
	#Tmux
	alias tkill="tmux kill-server"
	#.dotfiles
	alias config="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

  # Stylitics
	# root
	alias sty="cd ~/code/stylitics/apps"
  # Widget
  alias stywig="cd ~/code/stylitics/apps/widget-v3"
  alias stywigtest="stywig && PUPPETEER_EXECUTABLE_PATH=/opt/homebrew/bin/chromium CYPRESS_CSS=local make test"
  alias stywigdev="stywig && npm run dev"
  # Design System
  alias styds="cd ~/code/stylitics/apps/design-system"
  alias stydstest="styds && npm run test"
  alias stydsdev="styds && npm run dev"
  # API
  alias styapi="cd ~/code/stylitics/clj-widget-api"
  alias styapitest="styapi && lein test"
  alias styapidev="styapi && lein run dev"
	
	# Check Client stock prices
	alias styticker="ticker -w ANF,CHMP,KSS,M,NKE,PUMSY,TPR,WMT"
  # End Stylitics

autoload -U promptinit; promptinit
prompt pure

source $ZSH/oh-my-zsh.sh

# fzf catppuccin
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# bun completions
[ -s "/Users/stordahl/.bun/_bun" ] && source "/Users/stordahl/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/stordahl/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
