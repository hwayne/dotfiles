[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt
eval "$(hub alias -s)"
source ~/warp/warp
source ~/git-completion.bash


export IOS=~/espark/ios-app/eSpark.xcworkspace/
export CORE=~/espark/core
alias core="cd $CORE"
export EDITOR=vim

alias zr="zeus rspec"
alias h="history | grep"
alias g="grep -iR"
alias vi="echo NO"
alias vim="mvim -v"
alias sourceme="source ~/.bash_profile"
export GOPATH=/usr/local/Cellar/go/1.3/bin
export CLICOLOR=1

export PATH="$HOME/.local/utils/arcanist/bin:$PATH"
export PATH=$PATH:$GOPATH/bin

alias writing="cd ~/Dropbox/backup/documents/writing"
alias pivot="cd ~/.vim/bundle/vim-pivot/plugin"
alias safehouse="cd ~/Dropbox/backup/projects/safehouse"
alias django="python manage.py"
alias groku="git push heroku master"
export NOTEPAD=~/Dropbox/backup/documents/notepad
export MY_NAME=Hillel
export PATH="$HOME/.local/utils/arcanist/bin:$PATH"

export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=erasedups:ignorespace
shopt -s histappend

