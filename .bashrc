download_and_source () {
    local filename=$1
    local url=$2
    if [ ! -f $filename ]; then
        # The default wget in Termux does not support https, so I use Python instead
        python ~/download.py $url $filename
    fi
    source $filename
}

download_and_source ~/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

# Set the CLI prompt with git repo information of current dir
download_and_source ~/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# Note: since the \h in PS1 tends to be "localhost" on Termux,
# you might want to manually hardcode it in your own environment
PS1='\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u@\h\[$YELLOW\]\W$(__git_ps1 " (%s)")\[$WHITE\]\$ '

# A workaround for the ROXTerm on my AntiX 19, otherwise lazygit loses highlight color
alias tmux='TERM=xterm-256color tmux'

