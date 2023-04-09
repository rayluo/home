if command -v python3 &>/dev/null; then
    PYTHON=python3
else
    PYTHON=python
fi

download_and_source () {
    local filename=$1
    local url=$2
    if [ ! -f $filename ]; then
        # The default wget in Termux does not support https, so I use Python instead
        $PYTHON ~/download.py $url $filename
    fi
    source $filename
}

download_and_source ~/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
PURPLE='\[\e[1;35m\]'
purple='\[\e[0;35m\]'
nc='\[\e[0m\]'

# Set the CLI prompt with git repo information of current dir
download_and_source ~/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# Note: since the \h in PS1 tends to be "localhost" on Termux,
# you might want to manually hardcode it to your device name in your own environment.
# Note: Single quote somehow does not work in my bash. Switching to double quotes.
PS1="$nc\u$nc@$CYAN\H$nc:\w$nc$YELLOW\$(__git_ps1 \" (%s)\")$nc\$ "

# A workaround for the ROXTerm on my AntiX 19, otherwise lazygit loses highlight color
alias tmux='TERM=xterm-256color tmux'

export PATH=$PATH:~

# Trying to improve touchpad palm detection.
# Learnt from https://unix.stackexchange.com/questions/28306/looking-for-a-way-to-improve-synaptic-touchpad-palm-detectionly complely complely comly compleplely comple
synclient PalmDetect=1
synclient PalmMinWidth=4
synclient PalmMinZ=50
