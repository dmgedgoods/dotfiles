export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
#ZSH_THEME="gozilla"
plugins=(git)

export TMUX_CONFIG="~/.config/tmux/tmux.conf"
TMUX_SATUS_BAR=~/.config/tmux/TMUX_STATUS_BAR

source $ZSH/oh-my-zsh.sh
export PATH=/home/mack/.local/bin:$PATH

alias ll='ls -alhF'

server() {
	if [[ $2 ]];then
		python3 -m http.server $1 --directory $2
	else
		python3 -m http.server $1
	fi
}


vpn-up() {
	sudo pkill openvpn
	sudo openvpn /home/mack/Documents/HTB/lab_m0nk3.ovpn
}


nmap-full() {
	nmap -p- -sC -sV -A --min-rate=400 --min-parallelism=512 -vv $1
}


ffuf-dir() {
	ffuf -u $1 -w /usr/share/wordlists/dirb/big.txt ${@: 2};
}


ffuf-vhost() {
	ffuf -H "Host: FUZZ.$1" -u http://$1 -w /usr/share/wordlists/seclists/Discovery/DNS/subdomains-top1million-20000.txt ${@: 2};
}

fx() {
	feroxbuster -u $1 -w /usr/share/wordlists/seclists/Discovery/Web-Content/directory-list-2.3-small.txt ${@: 2};
}


lst(){
	rlwrap nc -lvnp $1
}

shell() {

	if [[ $1 ]]; then
		port=$1
	else
		port=9090
	fi

	stty raw -echo; (echo 'python3 -c "import pty;pty.spawn(\"/bin/bash\")" || python -c "import pty;pty.spawn(\"/bin/bash\")"' ;echo "stty$(stty -a | awk -F ';' '{print $2 $3}' | head -n 1)"; echo reset;cat) | nc -lvnp $port && reset

}

urlencode() {
        python3 -c "import sys; from urllib.parse import quote; print(quote(sys.stdin.read().strip()));"
}

urldecode() {
        python3 -c "import sys; from urllib.parse import unquote; print(unquote(sys.stdin.read().strip()));"
}

md5() {
	python3 -c 'import hashlib,sys; print(hashlib.md5(sys.stdin.read().encode()).hexdigest())'
}

##### TMUX options

tsa() {
	status_bar=$(cat $TMUX_SATUS_BAR)
	tmux set-option -g status-right "$1 $status_bar"
	echo "$1 $status_bar" > $TMUX_SATUS_BAR
}

tsd() {
	echo '[#{session_name}]' > $TMUX_SATUS_BAR
	status_bar=$(cat $TMUX_SATUS_BAR)
	tmux set-option -g status-right "$status_bar"
}
