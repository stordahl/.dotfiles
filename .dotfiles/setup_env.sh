#!/usr/local/bin/bash

echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "We're brewin! 🧪 – homebrew installed! ✨"

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh my! zsh is installed! ✨"

brew install git node gh ohmyzsh pure
echo "git installed! ✨"
echo "Node.js & npm installed! ✨"
echo "Github CLI installed! ✨"

npm i -g pnpm
echo "pnpm installed! 😅"

brew install nvim
echo "neovim installed! 💻"

brew install --cask raycast
echo "Raycast installed! 👀"

brew install --cask discord
echo "Discord installed! 🎤"

brew install --cask clickup
echo "ClickUp installed! ✅"

brew install --cask slack
echo "Slack installed! 😔"

read -p "Would you like to install Javascript Tooling? (y/n)" JSBOOL

case "$JSBOOL" in
  [yY] | [yY][eE][sS])  
    # JS Tooling Global installs Here!!! Add more if you'd like!
    echo "Installing TypeScript"
    npm install -g typescript
    echo "TypeScript installed! ✨"
    
    echo "Installing Netlify CLI"
    npm install -g netlify-cli
    echo "Netlify CLI installed! ✨"

		echo "Installing Vercel CLI"
		npm install -g vercel
		echo "Vercel CLI installed! ✨"

    echo "Installing Sanity CLI"
    npm install -g @sanity/cli
    echo "Sanity installed! ✨"
    # END OF JS Tooling
    break;;

  [nN] | [nN][oO])
    echo "Skipping JS Tooling"
    exit;;
  * )     
    echo "Please enter Y/y/YES/yes or N/n/NO/no";;
esac
  
echo "All done! 🥳" 
