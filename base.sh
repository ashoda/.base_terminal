if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

alias lsa='ls -aFhlG'
alias ll='ls -l'
alias search=grep
alias ..='cd ..'
alias ...='cd ../..'


[[ ! -f ./cds.sh ]] && source ./cds.sh
[[ ! -f ./git.sh ]] && source ./git.sh
[[ ! -f ./rails.sh ]] && source ./rails.sh


