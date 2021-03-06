# Default editor
export EDITOR=vim

# Path extensions
export PATH="${PATH}:${HOME}/.local/bin/:~/etc/scripts/"

# HTB connect > open current directory
alias htb_con="bash ~/htb/connect.sh ."

# TMUX shortcuts
alias tmuxl="tmux ls"
alias tmuxk="tmux kill-session -t"
alias tmuxa="tmux a -t"
alias tmuxn="tmux new -s"

# General aliases
alias :q="exit"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

# ===============
# HACKING HELPERS
# ===============
function nmap_ips() {
    cat $1 | grep for | cut -d" " -f5
}

function nmap_ports() {
    cat $1 | awk '/^[0-9]/ {print $1}' | cut -d"/" -f1 | paste -s -d ','
}

# =======
# HELPERS
# =======

# Copy file to clipboard
function clip() {
    cat $1 | xclip -selection clipboard
}

# Open all modified files in vim tabs
function vimod() {
    vim -p $(git status -suall | awk '{print $2}')
}

# ======
# PROMPT
# ======

# Git prompt
function git_prompt() {
    git branch 2> /dev/null | awk '$1 ~ /^\*/ {print "("$2") "}'
}

# Prompt characters
priv="$"

# Prompt colours
nameC="${txtblu}"
promptC="${txtylw}"
gitC="${txtpur}"

# Red name for root
if [ "${UID}" -eq "0" ]; then
    priv="#"
    nameC="${txtred}"
    promptC="${txtred}"
fi

# Prompt definition
export PS1="${promptC}${priv} ${nameC}\w ${gitC}\$(git_prompt)${promptC}» ${txtwht}"
