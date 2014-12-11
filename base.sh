#!/usr/bin/bash

BASE_DIR=`dirname $BASH_SOURCE`
[[ -f "$BASE_DIR/vendor/colors.sh" ]] && source "$BASE_DIR/vendor/colors.sh"


[ ! -n "$BASE_TERMINAL_SHORTCUTS" ] && BASE_TERMINAL_SHORTCUTS=()

function bt:add_shortcut {
	BASE_TERMINAL_SHORTCUTS+=("${IRed}[$3]${RCol}\t${Gre}$1${RCol} \t\t${Yel}=>${RCol}\t $2")
	eval "sc:${3}() { sc $3; }"
	alias "$1?"="echo -e ${2}"
	alias $1="$2"
}
function bt:add_function {
  BASE_TERMINAL_SHORTCUTS+=("${IRed}[$3]${RCol}\t${Gre}$1${RCol} \t\t${Yel}=>${RCol}\t $2")
  eval "sc:${3}() { sc $3; }"
  alias "$1?"="echo -e ${2}"
}

[[ -f "$BASE_DIR/cds.sh" ]] && source "$BASE_DIR/cds.sh"
[[ -f "$BASE_DIR/git.sh" ]] && source "$BASE_DIR/git.sh"
[[ -f "$BASE_DIR/rails.sh" ]] && source "$BASE_DIR/rails.sh"
[[ -f "$BASE_DIR/heroku.sh" ]] && source "$BASE_DIR/heroku.sh"
[[ -f "$BASE_DIR/ssh.sh" ]] && source "$BASE_DIR/ssh.sh"


function shortcuts? {
	for var in "${BASE_TERMINAL_SHORTCUTS[@]}"
	do
		echo -e "${var}";
	done | grep "$1"
}

alias ll='ls -laGh'
alias search=grep
alias ..='cd ..'
alias ...='cd ../..'

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
