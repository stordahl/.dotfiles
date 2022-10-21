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
		alias ff="fd --type f --hidden --exclude .git | fzf | xargs nvim"
  # Git
  alias g="git"
  alias gs="git status"
  alias gl="git log --oneline"
  alias yank="git pull"
  alias yeet="git push"
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
  # End Stylitics

autoload -U promptinit; promptinit
prompt pure

source $ZSH/oh-my-zsh.sh

# bun completions
[ -s "/Users/stordahl/.bun/_bun" ] && source "/Users/stordahl/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/stordahl/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH
