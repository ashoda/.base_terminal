alias rc='rails c'
alias rs='rails s'
alias rd='rails dbconsole'
alias rk='rake'
alias rkdbc='rake db:create'
alias rkdbm='rake db:migrate'
alias bi='bundle install'
alias bu='bundle update'

function rails? {
  echo "rc    -> rails c"
  echo "rs    -> rails s"
  echo "rd    -> rails dbconsole"
  echo "rk    -> bin/rake"
  echo "rkdbc -> bin/rake db:create"
  echo "rkdbm -> bin/rake db:migrate"
  echo "bi    -> bundle install"
  echo "bu    -> bundle update"
}
