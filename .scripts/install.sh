# Install Homebrew
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

# Install GNU Stow
brew install stow

# Clone Repo
git clone https://github.com/stordahl/.dotfiles.git ~/

# Create Dotfiles symlinks
cd .dotfiles
stow .
cd ../

# Install Brew Packages


# Setup TPM
mkdir -p ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
