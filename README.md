#.base_terminal

Basic dev utilities and shortcuts for common and useful terminal functionality.
	base.sh - base shortcuts and sourcing other functionality
	cds.sh - quickly view and navigation through directories
	git.sh - PS1 functionality and a handfull of git shortcuts 
	rails.sh - rails shortcuts 

## Installation

    cd ~
    git clone https://github.com/ashoda/.base_terminal.git

    add the following source to .bash_profile
    	"source ~/.base_terminal/base.sh"

## CDS Usage

	cds 	[enter] #=> list directories in current working directory
	
	cds . 	[enter] #=> list all directories in current working directory including hidden directories

	cds a 	[enter] #=> will cd into directory starting with the character "a" if there's only one ohterwise will list out directories that start with the character "a"  


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request