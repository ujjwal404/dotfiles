# Root path
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# import all the things
for file in ~/.{path,zsh_prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# iterm2 shell integration


# Path to my oh-my-zsh installation.
export ZSH="/Users/ujjwal/.oh-my-zsh"
export NODE_PATH='/usr/local/lib/node_modules'
# Oh-my-zsh theme
ZSH_THEME="af-magic"

# list of random themes to pick
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )


# Terminal plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
	git 
	colored-man-pages 
	colorize 
	pip
	python
	brew
	macos
	zsh-syntax-highlighting 
	zsh-autosuggestions
	)
source $ZSH/oh-my-zsh.sh

# to run c++ programs  
co() { g++ -std=c++17 -O2 -o "${1%.*}" $1 -Wall; }
run() { co $1 && ./${1%.*} & fg; }
showTime() { co $1 && gtime -v ./${1%.*} &fg; }

# Pyenv : to have diff python versions globally
PATH="~/.pyenv/versions/3.5.0/bin:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Flutter SDK
export PATH="$PATH:/Users/ujjwal/flutter/bin"

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


# Flex
export PATH="/usr/local/opt/flex/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/flex/lib"
export CPPFLAGS="-I/usr/local/opt/flex/include"

# Fuzzy logic Vim
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# For dotfiles
alias config='/usr/bin/git --git-dir=/Users/ujjwal/.config/ --work-tree=/Users/ujjwal'


