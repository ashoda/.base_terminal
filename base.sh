if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

alias lsa='ls -aFhlG'
alias ll='ls -l'
alias search=grep
alias ..='cd ..'
alias ...='cd ../..'

source ./.base_terminal/cds.sh
source ./.base_terminal/git.sh
source ./.base_terminal/rails.sh
