# Default editor
export EDITOR=vim

# Path extensions
export PATH="${PATH}:${HOME}/.local/bin/"

# HTB connect > open current directory
alias htb_con="bash ~/htb/connect.sh ."

# TMUX shortcuts
alias tmuxl="tmux ls"
alias tmuxk="tmux kill-session -t"
alias tmuxa="tmux a -t"

# General aliases
alias ls="ls --color=auto"
alias grep="grep --color=auto"

# Copy file to clipboard
function clip() {
    cat $1 | xclip -selection clipboard
}

# Open all modified files in vim tabs
function vimod() {
    vim -p $(git status -suall | awk '{print $2}')
}

# Git prompt
function git_prompt() {
    git branch 2> /dev/null | awk '$1 ~ /^\*/ {print "("$2") "}'
}

# Prompt colours
nameC="${txtblu}"
promptC="${txtylw}"
gitC="${txtpur}"

# Red name for root
if [ "${UID}" -eq "0" ]; then
    nameC="${txtred}"
    promptC="${txtred}"
fi

# Prompt definition
export PS1="${nameC}\u ${txtwht}:: ${nameC}\w ${gitC}\$(git_prompt)${promptC}\\$ » ${txtwht}"

