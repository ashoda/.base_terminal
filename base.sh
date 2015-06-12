#!/usr/bin/bash

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

BASE_DIR=`dirname $BASH_SOURCE`
[[ -f "$BASE_DIR/vendor/colors.sh" ]] && source "$BASE_DIR/vendor/colors.sh"
[[ -f "$BASE_DIR/shortcuts.sh" ]] && source "$BASE_DIR/shortcuts.sh"
[[ -f "$BASE_DIR/cds.sh" ]] && source "$BASE_DIR/cds.sh"
[[ -f "$BASE_DIR/git.sh" ]] && source "$BASE_DIR/git.sh"
[[ -f "$BASE_DIR/rails.sh" ]] && source "$BASE_DIR/rails.sh"
[[ -f "$BASE_DIR/heroku.sh" ]] && source "$BASE_DIR/heroku.sh"
[[ -f "$BASE_DIR/ssh.sh" ]] && source "$BASE_DIR/ssh.sh"

# ls with details and color
bt:add_shortcut ll      'ls -lhaG'                general

# up 'n' folders
bt:add_shortcut ..      'cd ..'             general
bt:add_shortcut ...     'cd ../..'          general
bt:add_shortcut ....    'cd ../../..'       general
bt:add_shortcut .....   'cd ../../../..'    general

# grep with color
bt:add_shortcut grep    'grep --color=auto' general

# ip
bt:add_shortcut ip      'ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2'     general
bt:add_shortcut ip1     "ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"   general

# lock computer
bt:add_shortcut lock    '/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend' general

# hibernation and sleep settings
bt:add_shortcut hibernate     'sudo pmset -a hibernatemode 25'  general
bt:add_shortcut sleep         'sudo pmset -a hibernatemode 0'   general
bt:add_shortcut safesleep     'sudo pmset -a hibernatemode 3'   general
bt:add_shortcut smartsleep    'sudo pmset -a hibernatemode 2'   general

bt:add_shortcut cd_bt         "cd $BASE_DIR"

# include bashrc if present
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
