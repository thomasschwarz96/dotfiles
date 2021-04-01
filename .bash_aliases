# Prompt definition
export PS1="\[\e[32m\]\u\[\e[m\] :: \[\e[34m\]\W\[\e[m\] \\$ "

# Default editor
export EDITOR=vim

# Path extensions
export PATH="${PATH}:${HOME}/.local/bin/"

# Pywal settings
(cat ~/.cache/wal/sequences &)

# Personal default aliases
alias glow="glow -p"

# HTB connect > open current directory
alias htb_con="bash ~/htb/connect.sh ."

# THM connect > open current directory
alias thm_con="bash ~/thm/connect.sh ."
