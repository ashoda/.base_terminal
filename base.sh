#!/usr/bin/bash

BASE_DIR=`dirname $BASH_SOURCE`

[[ -f "$BASE_DIR/cds.sh" ]] && source "$BASE_DIR/cds.sh"
[[ -f "$BASE_DIR/git.sh" ]] && source "$BASE_DIR/git.sh"
[[ -f "$BASE_DIR/rails.sh" ]] && source "$BASE_DIR/rails.sh"
[[ -f "$BASE_DIR/heroku.sh" ]] && source "$BASE_DIR/heroku.sh"

alias ll='ls -laGh'
alias search=grep
alias ..='cd ..'
alias ...='cd ../..'

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi