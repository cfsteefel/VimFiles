# .bash_profile

# User specific environment and startup programs

export GIT_PS1_SHOWDIRTYSTATE=1
export EDITOR="nvim"
export GIT_EDITOR=$EDITOR
export RIPGREP_CONFIG_PATH=~/.rg_config

source /usr/share/git-core/contrib/completion/git-prompt.sh

PROMPT_COMMAND=__prompt_command
__prompt_command () {
   gp=$(__git_ps1 '%s')
   export PS1="\[\e[91m\]\u@\h:\[\e[91m\]\[\e[91m\]\W\[\e[m\] \[\e[95m\][$?\[\e[m\]\[\e[95m\]]\[\e[m\]\[\e[95m\]\[\e[m\] \[\e[95m\]\\$\[\e[m\]\n\[\e[94m\]${gp}>\[\e[m\] "
}

function addToPATH {
  case ":$PATH:" in
    *":$1:"*) :;; # already there
    *) PATH="$1:$PATH";; # or PATH="$PATH:$1"
  esac
}

alias vim="nvim -p"
alias vimdiff="nvim -d"
cpu16() { grep ^processor /proc/cpuinfo | sort -R | head -n 24 | awk '{print $3}'; }
kindly() { taskset $(printf '0x%x\n' $(($(cpu16 | paste -sd '|')))) "$@"; }

