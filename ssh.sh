function ssh:reset {
ssh-add -D
if [ -f ~/.ssh/id_github_rsa ]; then
  ssh-add ~/.ssh/id_github_rsa
fi
}