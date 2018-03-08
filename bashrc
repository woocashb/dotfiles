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

export haproxycfg=/etc/haproxy/haproxy.cfg

# apache
export httpdconf=/etc/httpd/conf/httpd.conf
export httpdlog=/var/log/httpd
export httpdconfd=/etc/httpd/conf.d
export html=/var/www/html

# postgres
export pgdata=$(ps -ef | grep postgres | grep -- '-D' | cut -d 'D' -f 2 | tr -d ' ')
export pglog=${pgdata}/pg_log/$(date "+%Y%m%d_%H00-postgresql.log")


