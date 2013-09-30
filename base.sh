if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

alias lsa='ls -aFhlG'
alias ll='ls -l'
alias search=grep
alias ..='cd ..'
alias ...='cd ../..'


if [ ! -f ./cds.sh ]; then
   source ./cds.sh
fi

if [ ! -f ./git.sh ]; then
   source ./git.sh
fi

if [ ! -f ./rails.sh ]; then
   source ./rails.sh
fi

