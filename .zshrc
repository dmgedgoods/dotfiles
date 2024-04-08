
# pure prompt
#autoload -U promptinit; promptinit
#PURE_CMD_MAX_EXEC_TIME=1
#zstyle :prompt:pure:path color white
#zstyle :prompt:pure:git:dirty color red
#zstyle :prompt:pure:user color green
#zstyle :prompt:pure:host color green
#zstyle ':prompt:pure:prompt:*' color green
#prompt pure

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:/.local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GTK_THEME=Adwaita:dark
export TMUX_CONFIG="~/.config/tmux/tmux.conf"
TMUX_STATUS_BAR=~/.config/tmux/TMUX_STATUS_BAR




# Theme 
#ZSH_THEME="wezm"
#ZSH_THEME="gallois"
#ZSH_THEME="josh"
ZSH_THEME="mack"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)

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
function ge() {
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
alias td="tmux detach"
alias ta="tmux attach"
alias tk="tmux kill-server"

# QOL stuff
function server() {
    python3 -m http.server "$1" 
}
alias par="ws ssh:mack@parrot"
alias cae="ws ssh:mack@caesar"
alias fed="ws ssh:mack@fedora"
alias kali="ws ssh:mack@kali"
alias winblows="ws ssh:mack@winblows"
alias recon="ws ssh:mack@recon"
#alias dev="ssh mack@monke-dev"
#alias rec="ssh mack@monke-recon"
#alias cdf="cd $(find * -type d | fzf --preview 'batcat --color=always {}')"
#alias wsjava="/home/mack/.local/bin/scripts/tmux-sessionizer.sh ~/Work/Java-stuff" 
#alias wspy="/home/mack/.local/bin/scripts/tmux-sessionizer.sh ~/Work/python" 
#alias wshtb="/home/mack/.local/bin/scripts/tmux-sessionizer.sh ~/HTB" 
function ws() {
  # Check for SSH session prefix
  if [[ $1 == ssh:* ]]; then
    local ssh_target="${1#ssh:}" # Extract the part after "ssh:"
    local session_name=$(echo "$ssh_target" | sed 's/[^a-zA-Z0-9]/_/g') # Create a session name by replacing non-alphanumeric characters with underscores

    # Check if the tmux session already exists
    if tmux has-session -t "$session_name" 2>/dev/null; then
      # Attach to the existing session
      tmux attach-session -t "$session_name"
    else
      # Start a new tmux session locally with the derived session name and send the SSH command to it
      tmux new-session -d -s "$session_name" "ssh $ssh_target"
      tmux attach-session -t "$session_name"
    fi
    return # Exit the function after setting up the tmux session with SSH
  fi

  local project_path="./$1" # Default base directory is ~/Work

  # Special cases for different base directories
  if [[ $1 == "HTB" ]]; then
    project_path="$HOME/HTB"
  fi

  # Create the directory if it doesn't exist
  if [ ! -d "$project_path" ]; then
    mkdir -p "$project_path"
  fi

  # Call the tmux-sessionizer script with the resolved project path
  "$HOME/.local/bin/scripts/tmux-sessionizer.sh" "$project_path"
}


function htb-init() {
	if [[ $1 ]]; then			
		mkdir -p /home/mack/HTB/$1/files
		mkdir -p /home/mack/HTB/$1/exploits
		cd /opt/drop
		/usr/bin/python3 -m http.server 8080 > /dev/null 2>&1 &
		echo $! > /home/mack/HTB/$1/.server.pid
		cd /home/mack/HTB/$1
		clear
	else
		echo 'Usage: htb-init Moderators'
	fi
}

function htb-setup() {
    source ~/HTB/misc/htb.sh
}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


