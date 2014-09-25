alias rc='rails c'
alias rs='rails s'
alias rd='rails dbconsole'
alias rk='bin/rake'
alias rkdbc='bin/rake db:create'
alias rkdbm='set_test bin/rake db:migrate && set_dev bin/rake db:migrate'
alias bi='bundle install'
alias bu='bundle update'

alias set_prod='RAILS_ENV=production'
alias set_test='RAILS_ENV=test'
alias set_dev='RAILS_ENV=development'

function rails? {
  echo "rc    -> rails c"
  echo "rs    -> rails s"
  echo "rd    -> rails dbconsole"
  echo "rk    -> bin/rake"
  echo "rkdbc -> bin/rake db:create"
  echo "rkdbm -> bin/rake db:migrate"
  echo "bi    -> bundle install"
  echo "bu    -> bundle update"
  echo "set_prod -> RAILS_ENV=production"
  echo "set_dev -> RAILS_ENV=development"
  echo "set_test -> RAILS_ENV=test"
}
