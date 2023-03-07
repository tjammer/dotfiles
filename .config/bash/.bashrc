# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export PS1="\[\033[38;5;12m\]\[$(tput sgr0)\]\[\033[38;5;05m\]\u\[$(tput sgr0)\]\[\033[38;5;12m\]\[$(tput sgr0)\]\[\033[38;5;12m\]\w\[$(tput sgr0)\]\[\033[38;5;12m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

export HISTSIZE=
export HISTFILESIZE=

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind "set menu-complete-display-prefix on"

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
eval "$(direnv hook bash)"

# save path on cd
function cd {
    builtin cd $@
    pwd > ~/.last_dir
}

# restore last saved path
if [ -f ~/.last_dir ]
    then cd `cat ~/.last_dir`
fi
