if [ -f ~/.git-prompt.sh ]; then
	source ~/.git-prompt.sh
 . ~/.git-prompt.sh
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWCOLORHINTS=true
	GIT_PS1_UNTRACKEDFILES=true
	PROMPT_COMMAND="__git_ps1 '\u@\h:\w' '\\$ '"
fi

alias g=git
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gpull='git pull'
alias gpush='git push'