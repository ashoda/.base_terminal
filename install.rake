  namespace :install do
  	desc "Install CDS"
  	task :cds do
  		if ! type "cds" > /dev/null; then
  			cd ~
  			[ -d terminal_helpers ] || mkdir terminal_helpers 
  			
		fi
  	end






  end