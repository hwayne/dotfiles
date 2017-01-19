export EDITOR=nvim
alias vim="nvim"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt
export CLASSPATH=$CLASSPATH:~/specs/tla2tools.jar
eval "$(hub alias -s)"
source ~/warp/warp
source ~/git-completion.bash
source ~/.secret


export CORE=~/espark/core
alias core="cd $CORE"

alias r="rspec"
alias h="history | grep"
alias sourceme="source ~/.bash_profile"
export CLICOLOR=1


alias writing="cd ~/Dropbox/backup/documents/writing"
alias pivot="cd ~/.vim/bundle/vim-pivot/plugin"
alias safehouse="cd ~/Dropbox/backup/projects/safehouse"
alias projects="cd ~/Dropbox/backup/projects/"
export MY_NAME=Hillel

export HISTSIZE=5000
export HISTFILESIZE=10000
export HISTCONTROL=erasedups:ignorespace
shopt -s histappend


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
