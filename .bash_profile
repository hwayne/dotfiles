
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias master="git checkout master"
alias gpull="git pull"
alias gpush="git push -u origin"
alias gb="git branch"
alias gm="git merge master"
alias gc="git checkout"
alias commit="git commit -am "
source ~/warp/warp

alias h="history | grep"
alias g="grep -iR"
alias vi="echo NO"
alias sourceme="source ~/.bash_profile"
export GOPATH=/usr/local/Cellar/go/1.3/bin
export PATH=$PATH:$GOPATH/bin
export CLICOLOR=1

alias writing="cd ~/Dropbox/backup/documents/writing"
alias pivot="cd ~/.vim/bundle/vim-pivot/plugin"
alias safehouse="cd ~/Dropbox/backup/projects/safehouse"
alias django="python manage.py"
alias groku="git push heroku master"
export NOTEPAD=~/Dropbox/backup/documents/notepad
export MY_NAME=Hillel
