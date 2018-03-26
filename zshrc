# Path to your oh-my-zsh installation.
export DISABLE_CORRECTION="true" 
export ZSH=/home/woocash/.oh-my-zsh
export lan=10.12.1.
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#superjarin minimal jnrowe eastwood wezm miloshadzic
ZSH_THEME="aussiegeek"
#ZSH_THEME='miloshadzic'
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

# User configuration
export DISPLAY=:0
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/java/bin:/opt/java/db/bin:/opt/java/jre/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/local/texlive/2011/bin/x86_64-linux:/home/archer/bin:/usr/local/texlive/2011/bin/x86_64-linux:/home/archer/bin"
# export MANPATH="/usr/local/man:$MANPATH"
DISABLE_AUTO_UPDATE="yes"
source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
BIN_PATH="/usr/bin"
export PATH="/home/woocash/bin:$PATH"
alias writer="$BIN_PATH/libreoffice --writer"
alias calc="$BIN_PATH/libreoffice --calc"
alias wireshark=wireshark-gtk
alias hg='history | grep'
alias mplayer='mplayer -nokeepaspect'
alias egrep='egrep --color'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export BROWSER='/usr/bin/chromium'

# make ctrl arrow work with tmux
bindkey ";5D" backward-word 
bindkey ";5C" forward-word


# Key bindings
#bindkey "^[[B" history-beginning-search-forward
#bindkey "^[[A" history-beginning-search-backward
#case "$TERM" in
#    screen*)
#    PROMPT_COMMAND="printf '\033k$(hostname)\033\\';"${PROMPT_COMMAND}
#;;
#esac

#nowe
bindkey "^[[3~" delete-char
bindkey "^[On"  delete-char-num



#bindkey "^[OA" history-substring-search-up
bindkey "Up" history-substring-search-up
#bindkey "^[OB" history-substring-search-down
bindkey "Down" history-substring-search-down

# for rxvt
bindkey "e[8~" end-of-line
bindkey "e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "eOH" beginning-of-line
bindkey "eOF" end-of-line
# for freebsd console
bindkey "e[H" beginning-of-line
bindkey "e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix


case $TERM in
	screen*)
		precmd(){
			# Restore tmux-title to 'zsh'
			printf "\033kzsh\033\\"
			# Restore urxvt-title to 'zsh'
			print -Pn "\e]2;zsh:%~\a"
		}
		preexec(){
			# set tmux-title to running program
			printf "\033k$(echo "$1" | cut -d" " -f1)\033\\"
			# set urxvt-title to running program
			print -Pn "\e]2;zsh:$(echo "$1" | cut -d" " -f1)\a"
                }
                ;;
esac
source ~/.srvs
unsetopt correct

simplivity="10.1.255."
osip_all=(141 142 143 144 145 146 147 148 149 150)
osip_app=(143 144)
osip_ha=(141 142)
osip_db=(145 146 147 148 149 150)
mongoconfig=(148 149 150)
mongoreplika=(145 146 147)


sobapi=(
10.1.255.200
10.1.255.201
10.1.255.207
10.1.255.208
10.1.255.213
10.1.255.214
10.1.255.215
10.1.255.220
10.1.255.221
10.1.255.222
)

stareip=(
10.1.255.162
10.1.255.170
10.1.255.163
10.1.255.171
10.1.255.165
10.1.255.173
10.1.255.196
10.1.255.166
10.1.255.174
10.1.255.197
)

unsetopt correct
unsetopt correct_all
# .bashrc


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
export DISPLAY=:0
export browset=/usr/bin/firefox
alias pip="pip --proxy http://192.168.0.4:3128"
alias vim=vi
alias yum=dnf
export http_proxy=http://192.168.0.4:3128
export pgdata=$(ps -ef | grep postgres | grep -- '-D' | cut -d 'D' -f 2 | tr -d ' ')
export network=/etc/sysconfig/network-scripts

# User specific aliases and functions
export HISTTIMEFORMAT="%d/%m/%y %T "
#
# ~/.bashrc
#

# If not running interactively, don't do anything

alias ls='ls --color=auto'

scproxy(){
 src=$1
 ip_proxy=$(echo $3 | cut -d ':' -f1)
 ip_dst=$(echo $2 | cut -d ':' -f1)
 scp -o ProxyCommand="ssh ${ip_proxy} nc $ip_dst 22" $1 $2
}

# z -print0
findsum(){
du --files0-from=- -hc | tail -n1
}

netprobe(){
nmap -v -sn -n $1 -oG - | awk '/Status: Down/{print $2}'
}

vimcp(){
 if [[ -w $1 ]];then
  set -x 
  cp -p $1{,_$(date "+%F")}
  vim $1
  set +x
 else
  echo "Brak uprawnien do modyfikacji."
 fi
}

pwdgen(){
openssl rand -base64 $1
}

topmem(){
ps -eo pid,%mem,comm | sort -k 2 -r | head -n $1
}

topcpu(){
ps -eo pid,%cpu,comm | sort -k 2 -r | head -n $1
}

export haproxycfg=/etc/haproxy/haproxy.cfg

# apache
export httpdconf=/etc/httpd/conf/httpd.conf
export httpdlog=/var/log/httpd
export httpdconfd=/etc/httpd/conf.d
export html=/var/www/html

# postgres
export pgdata=$(ps -ef | grep postgres | grep -- '-D' | cut -d 'D' -f 2 | tr -d ' ')
#export pglog=$(lsof -p $(ps -ef | egrep -i 'postgres: logger' | grep -v grep | awk '{print $2}') | grep -i log | tail -n 1 | awk '{print $9}')


