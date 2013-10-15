source "$BASE_DIR/vendor/.git-prompt.sh"

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_UNTRACKEDFILES=true
if [ ! PS1 ]; then
	PROMPT_COMMAND="__git_ps1 '\u@\h:\w' '\\$ '"
fi 

alias g=git
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit'
alias gco='git checkout'
alias gpull='git pull'
alias gpush='git push'
alias gstash='git stash'
