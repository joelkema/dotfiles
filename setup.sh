# source "helpers.sh"

# Check which OS we're running and install the necessary packages
if [[ "$OSTYPE" == "darwin"* ]]; then

	echo "Running macOS"

	# Install homebrew if it's not already installed
	if [[ ! -x "$(command -v brew)" ]]; then
		echo "Installing Homebrew"

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

		echo "Installing Homebrew/bundle"

        # Install Brewfile
        brew bundle install
	fi
	
 elif [[ -f /etc/alpine-release ]]; then

	echo "Running Alpine"
	echo "Performing an update first"
	sudo apk update
	
	echo "Installing necessary packages using apk"
	sudo apk add zsh
	sudo apk add chsh
	sudo apk add git
	sudo apk add curl
	sudo apk add gcc
	sudo apk add neovim
	sudo apk add tmux
	sudo apk add golang
	sudo apk add nvm
	sudo apk add pnpm
	sudo apk add fzf
	sudo apk add ripgrep
	sudo apk add ffmpeg
	sudo apk add nmap
	sudo apk add htop
	sudo apk add parallel
	sudo apk add tree
	sudo apk add watch
	sudo apk add stow
fi

# Set zsh as the default shell
echo "Setting zsh as the default shell"
chsh -s $(which zsh)

