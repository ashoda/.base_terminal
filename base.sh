#!/usr/bin/bash
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

BASE_DIR=`dirname $BASH_SOURCE`

[[ -f "$BASE_DIR/cds.sh" ]] && source "$BASE_DIR/cds.sh"
[[ -f "$BASE_DIR/git.sh" ]] && source "$BASE_DIR/git.sh"
[[ -f "$BASE_DIR/rails.sh" ]] && source "$BASE_DIR/rails.sh"
[[ -f "$BASE_DIR/heroku.sh" ]] && source "$BASE_DIR/heroku.sh"

alias lsa='ls -aFhlG'
alias ll='ls -l'
alias search=grep
alias ..='cd ..'
alias ...='cd ../..'