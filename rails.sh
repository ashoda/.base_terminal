bt:add_shortcut rc 'rails c' rails
bt:add_shortcut rs 'rails s' rails
bt:add_shortcut be 'bundle exec' bundle exec
bt:add_shortcut rd 'rails dbconsole' rails
bt:add_shortcut bi 'bundle install' rails
bt:add_shortcut bu 'bundle update' rails
bt:add_shortcut rk 'bin/rake' rails
bt:add_shortcut rkdbc 'bin/rake db:create' rails
bt:add_shortcut rkdbm 'set_test bin/rake db:migrate && set_dev bin/rake db:migrate' rails

bt:add_shortcut set_prod 'RAILS_ENV=production' rails
bt:add_shortcut set_test 'RAILS_ENV=test' rails
bt:add_shortcut set_dev 'RAILS_ENV=development' rails
