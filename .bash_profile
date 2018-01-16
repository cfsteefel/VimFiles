# lhopt -s expand_aliases
export PATH=$PATH:~/.vim/colors
PROMPT_COMMAND=__prompt_command
__prompt_command () {
  export PS1="\[\e[91m\]GintsMBP:\[\e[91m\]\[\e[91m\]\W\[\e[m\] \[\e[95m\][$?\[\e[m\]\[\e[95m\]]\[\e[m\]\[\e[95m\]\[\e[m\] \[\e[95m\]\\$\[\e[m\] "
}
alias csteefel='ssh csteefel@ieng6.ucsd.edu'
alias caff='caffeinate -d &'
alias decaff='pkill caffeinate'
alias vim='vim -p'
alias python='python2'
alias ocaml="rlwrap ocaml"

# OPAM configuration
. /Users/christoph/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
