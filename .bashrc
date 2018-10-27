# Set the CLI prompt with git repo information of current dir
if [ ! -f ~/git-prompt.sh ]; then
    cd
    # The default wget in Termux does not support https, so I use Python 3 instead
    python -c "from urllib.request import urlopen; open('git-prompt.sh', 'wb').write(urlopen('https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh').read())"
fi
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# Note: since the \h in PS1 tends to be "localhost" on Termux,
# you might want to manually hardcode it in your own environment
PS1='\[$GREEN\]\t\[$RED\]-\[$BLUE\]\u@\h\[$YELLOW\]\W$(__git_ps1 " (%s)")\[$WHITE\]\$ '

