source "$BASE_DIR/vendor/.git-prompt.sh"

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_UNTRACKEDFILES=true
force_color_prompt=yes

# PROMPT_COMMAND="__git_ps1 '\[\033[01;31m\]\u@local\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]' '\\$'"
export PS1='\[\033[35m\]\W\[\033[0m\] \[\033[32m\]$(__git_ps1 "[%s]")\[\033[0m\]$ '

bt:add_shortcut g git git
bt:add_shortcut gs 'git status' git
bt:add_shortcut gd 'git diff' git
bt:add_shortcut ga 'git add' git
bt:add_shortcut ga. 'git add .' git
bt:add_shortcut gc 'git commit' git
bt:add_shortcut gcm 'git commit -m' git
bt:add_shortcut gcam 'git commit -am' git
bt:add_shortcut gfe 'git fetch' git
bt:add_shortcut gme 'git merge' git
bt:add_shortcut gre 'git rebase' git
bt:add_shortcut gbl 'git branch -v' git
bt:add_shortcut grl 'git remote -v' git
bt:add_shortcut gfo 'git fetch origin' git
bt:add_shortcut gco 'gbc; git checkout' git
bt:add_shortcut gcob 'git checkout -b' git
bt:add_shortcut gpll 'git pull' git
bt:add_shortcut gpllo 'git pull origin' git
bt:add_shortcut gpsh 'git push' git
bt:add_shortcut gpsho 'git push origin' git
bt:add_shortcut gsh 'git stash' git
bt:add_shortcut gcom 'git checkout master' git
bt:add_shortcut gbc 'git symbolic-ref --short HEAD'
bt:add_shortcut gbc 'git symbolic-ref --short HEAD | pbcopy'
