# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GTK_THEME=Adwaita:dark
export TMUX_CONFIG="~/.config/tmux/tmux.conf"
TMUX_STATUS_BAR=~/.config/tmux/TMUX_STATUS_BAR

# Theme 
ZSH_THEME="josh"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Autocomplete
#autoload -Uz compinit && compinit 

source $ZSH/oh-my-zsh.sh

# User configuration

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

# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Basic terminal stuff
alias ll="ls -l"
alias c="clear"

# Java stuff
#alias java="java -cp ~/algs4.jar"
#alias javac="javac -cp ~/algs4.jar"
alias java="java -cp ./out"
alias javac="javac -d ./out"

# Github stuff
function fugit() {
    git add --all && git commit -m "$1" && git push
}
#alias fugit="fugit"
#alias gg="git add --all && git commit -m 'quick add' && git push"

# TMUX stuff
tsa() {
	status_bar=$(cat $TMUX_STATUS_BAR)
	tmux set-option -g status-right "$1 $status_bar"
	echo "$1 $status_bar" > $TMUX_STATUS_BAR
}

tsd() {
	echo '[#{session_name}]' > $TMUX_STATUS_BAR
	status_bar=$(cat $TMUX_STATUS_BAR)
	tmux set-option -g status-right "$status_bar"
}
# function tsa() {
# 	#echo '[#{session_name}]' > $TMUX_STATUS_BAR
# 	#status_bar=$(cat $TMUX_STATUS_BAR)
# 	tmux set-option -g status-right "$1"
# }
# function tsd() {
# 	#echo '[#{session_name}]' > $TMUX_STATUS_BAR
# 	#status_bar=$(cat $TMUX_STATUS_BAR)
# 	tmux set-option -g status-right ""
# }

#alias tmux="TERM=screen-256color-bce tmux"
alias tdet="tmux detach"
alias tat="tmux attach"
alias tkill="tmux kill-server"

# QOL stuff
function server() {
    python3 -m http.server "$1" 
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

