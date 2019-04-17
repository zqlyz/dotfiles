# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

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
#alias
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias vi='vim'
alias which='(alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-tilde --show-dot'
alias xzegrep='xzegrep --color=auto'
alias xzfgrep='xzfgrep --color=auto'
alias xzgrep='xzgrep --color=auto'
alias zegrep='zegrep --color=auto'
alias zfgrep='zfgrep --color=auto'
alias zgrep='zgrep --color=auto'
#使用pip3 代替pip
alias pip='pip3'

# c/c++ 相关
LD_LIBRARY_PATH="/usr/local/lib:/usr/lib:/lib:$LD_LIBRARY_PATH";
export LD_LIBRARY_PATH;
