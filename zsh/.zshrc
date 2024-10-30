# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Default editor for tmuxinator
export EDITOR='code'

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="blinks"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. o
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ssh-agent vscode)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=/opt/homebrew/bin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

# mkdir: create parent directories
alias mkdir="mkdir -pv" 

# Zsh configs
alias zshconfig="code ~/.zshrc"
alias ohmyzsh="code ~/.oh-my-zsh"
alias reload="source ~/.zshrc"

# .dotfiles repository
alias dotfiles="nvim ~/.dotfiles"

# tmux
alias start-tmux="tmuxinator monitor"

# chrome
alias cchrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir="/tmp/chrome_dev_session" --disable-local-storage'

# anwb proxy settings
# export http_proxy=http://proxy.anwb.local:8080
# export https_proxy=${http_proxy}
# export HTTP_PROXY=${http_proxy}
# export HTTPS_PROXY=${http_proxy}
# export no_proxy=localhost,127.0.0.*,*.anwb.local,10.*,172.*,192.*,*.vpce.amazonaws.com
# export NO_PROXY=${no_proxy}

# anwb-connect
alias start-server="~/git/anwb/it-kanalen/app-center/shared/anwb-openconnect; python3 -m http.server 8081"
alias start-vpn="sh ~/git/anwb/it-kanalen/app-center/shared/anwb-openconnect/anwb-openconnect.sh"
# alias start-server="~/git/VPN/connect.sh"
# alias start-vpn="sh ~/VPN/connect.sh"
# alias disconnect-vpn="sh ~/VPN/disconnect.sh"


# anwb repositories
alias snfcar="~/git/anwb/it-kanalen/car/car-star/frontend/search-and-filter-cars"
alias tns="~/git/anwb/it-kanalen/car/car-star/frontend/tests-and-specifications"
alias kt="~/git/anwb/it-kanalen/car/car-star/frontend/car-calculators"
alias ac="~/git/anwb/it-kanalen/car/car-star/frontend/auto-centraal"
alias plein="~/git/anwb/it-kanalen/car/car-star/frontend/auto-plein"
alias expertplatform="~/git/anwb/traffic/frontend/experts-platform"
alias expertfe="~/git/anwb/webcare/experts-frontend"

# anwb-fe repositories
alias chapter="~/git/anwb-fe/chapter/chapter"

# personal repositories
alias personal="~/git/personal"
alias aoc="~/git/personal/advent-of-code"

# alias air='~/.air'

# pnpm
export PNPM_HOME="/Users/p295855/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# always start neofetch on startup
neofetch

# bun completions
[ -s "/Users/p295855/.bun/_bun" ] && source "/Users/p295855/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# templ
# export PATH="$HOME/go/bin/:$PATH" 

# go
export GOPATH="/Users/p295855/go"
export PATH="$GOPATH/bin:$PATH"

# tmux-sessionizer
export PATH="$HOME/.dotfiles/bin:$PATH"
