source "$BASE_DIR/vendor/.git-prompt.sh"

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_UNTRACKEDFILES=true
force_color_prompt=yes

PROMPT_COMMAND="__git_ps1 '\[\033[01;31m\]\u@local\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]' '\\$'"

alias g=git
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias ga.='git add .'
alias gc='git commit'
alias gf='git fetch'
alias gm='git merge'
alias gbl='git branch -v'
alias grl='git remote -v'
alias gfo='git fetch origin'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gpll='git pull'
alias gpsh='git push'
alias gsh='git stash'
alias gcom='git checkout master'


function git? {
  echo "g     -> git"
  echo "gs    -> git status"
  echo "gd    -> git diff"
  echo "ga    -> git add"
  echo "ga.   -> git add ."
  echo "gc    -> git commit"
  echo "gf    -> git fetch"
  echo "gm    -> git merge"
  echo "gbl   -> git branch -v"
  echo "grl   -> git remote -v"
  echo "gfo   -> git fetch origin"
  echo "gco   -> git checkout"
  echo "gcom   -> git checkout master"
  echo "gcob  -> git checkout -b"
  echo "gpll  -> git pull"
  echo "gpsh  -> git push"
  echo "gsh   -> git stash"
}