#.base_terminal

Basic dev utilities and shortcuts for common and useful terminal functionality.

	1.base.sh - base shortcuts and sourcing other functionality
	2.cds.sh - quickly view and navigation through directories
	3.git.sh - PS1 functionality and a handfull of git shortcuts 
	4.rails.sh - rails shortcuts 

## Installation

    cd ~
    git clone https://github.com/ashoda/.base_terminal.git
    cd .base_terminal
    ./setup.sh
    

## CDS Usage

	cds 	[enter] #=> list directories in current working directory
	
	cds . 	[enter] #=> list all directories in current working directory including hidden directories

	cds a 	[enter] #=> will cd into directory starting with the character "a" if there's only one ohterwise will list out directories that start with the character "a"  

## Heroku Config Search (heroku:configs) Usage

	-Simple Usage
	heroku:configs "" app1_name
	#> list all config vars for app1

	heroku:configs ConfigVar app1_name
	#> list config vars for app1 that match ConfigVar

	-Search Multiple Config Variables At Once
	heroku:configs ConfigVar1,PartialConfigVar2,ConfigVar3 app1_name 	
	#> list config vars for app1 that match ConfigVar1, PartialConfigVar2 and ConfigVar3

	-Search Multiple Config Variables At Once In Multiple Apps
	heroku:configs ConfigVar1,PartialConfigVar2,ConfigVar3 app1_name app2_name partial_app3_name
	#> list config vars for app1 app2 and app3 that match ConfigVar1, PartialConfigVar2 and ConfigVar3


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
