function ssh:reset {
  ssh-add -D
  if [ -f ~/.ssh/id_github_rsa ]; then
    ssh-add ~/.ssh/id_github_rsa
  fi
}

function ssh:add {
  if [ -f ~/.ssh/$1 ]; then
    ssh-add ~/.ssh/$1
  else
    ls ~/.ssh/  
  fi
}