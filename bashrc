# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

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
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

scproxy(){
 src=$1
 ip_proxy=$(echo $3 | cut -d ':' -f1)
 ip_dst=$(echo $2 | cut -d ':' -f1)
 scp -o ProxyCommand="ssh ${ip_proxy} nc $ip_dst 22" $1 $2
}

# z -print0
findsum(){
awk 'BEGIN { suma = 0 } { suma += $1} END { print "Suma: ", suma "M"}'
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
arg=$1
n=${arg:=10}
ps -eo pid,%mem,comm | sort -k 2 -r | head -n $n
}

topcpu(){
arg=$1
n=${arg:=10}
ps -eo pid,%cpu,comm | sort -k 2 -r | head -n $n
}


# haproxy
export hacfg=/etc/haproxy/haproxy.cfg
export halog=/var/log/haproxy.log

# apache
export hconf=/etc/httpd/conf/httpd.conf
export hlog=/var/log/httpd
export hconfd=/etc/httpd/conf.d
export hroot=/var/www/html

# nginx
export nconf=/etc/httpd/conf/nginx.conf
export nlog=/var/log/nginx
export nconfd=/etc/nginx/conf.d
export nroot=/usr/share/nginx/html

# postgres
export pgdata=$(ps -ef | grep postgres | grep -- '-D' | cut -d 'D' -f 2 | tr -d ' ')
export pghba=${pgdata}/pg_hba.conf
export pglog=$(lsof -p $(ps -ef | egrep -i 'postgres: logger' | grep -v grep | awk '{print $2}') 2> /dev/null | grep -i log | tail -n 1 | awk '{print $9}')


