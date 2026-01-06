#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias vis='visualizer'
alias chrome-fix='google-chrome-stable --ozone-platform=x11 --disable-gpu'
eval "$(starship init bash)"