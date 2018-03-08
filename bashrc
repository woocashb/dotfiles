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
