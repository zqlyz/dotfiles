# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# Add Git Status to bash prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
} 

#PS1
PS1_GREEN="\e[92m"
PS1_WHITE="\e[39m"
PS1_RED="\e[91m"
PS1_YELLOW="\e[93m"
PS1_PURPLE="\e[95m"
PS1="\[$PS1_GREEN\]\u\[$PS1_WHITE\]@\[$PS1_RED\]\h \[$PS1_YELLOW\]\w\[$PS1_PURPLE\]\$(parse_git_branch)\[$PS1_WHITE\]\n$ " 
#env
source ~/.my_env

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
