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

vimcp(){
 set -x 
 cp -p $1{,_$(date "+%F")}
 vim $1
 set +x
}

export haproxy=/etc/haproxy/haproxy.cfg

# apache
export httpdconf=/etc/httpd/conf/httpd.conf
export httpdlog=/var/log/httpd
export httpdconfd=/etc/httpd/conf.d

# postgres
export pgdata=$(ps -ef | grep postgres | grep -- '-D' | cut -d 'D' -f 2 | tr -d ' ')
export pglog=${pgdata}/pg_log/$(date "+%Y%m%d_%H00-postgresql.log)


