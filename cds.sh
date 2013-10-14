function cds {	
	
	# view and or cd into bookmark
	if [[ $1 == "-" ]]; then
		
		array=( $( cat "$BASE_DIR/.cds-bookmarks" ) )	
		
		echo -e "\033[0;32mBookmarked Directories: \033[m"
		indexed_list $array
		select_directory $array
		
	# add pwd to bookmarks or specify directory within the current directory
	elif [[ $1 == "-a" ]] ||  [[ $1 == "-af" ]]; then 

		if [[ $2 != "" ]]; then
			if [[ $2 =~ ^.*\/$ ]]; then
				BOOKMARK="$(pwd)/$2"
			else
				BOOKMARK="$(pwd)/$2/"
			fi
		else
			BOOKMARK="$(pwd)/"
		fi

		UPDATED=$( grep -v -o "^$BOOKMARK$" "$BASE_DIR/.cds-bookmarks" )
		
		if [[ $1 == "-af" ]]; then 
			echo "$BOOKMARK" > "$BASE_DIR/.cds-bookmarks"
			echo "$UPDATED" >> "$BASE_DIR/.cds-bookmarks"

		else
			echo "$UPDATED" > "$BASE_DIR/.cds-bookmarks"
			echo "$BOOKMARK" >> "$BASE_DIR/.cds-bookmarks"
		fi
		echo -e  "\033[1;32mbookmark added: \033[m $BOOKMARK"

	# delete current pwd from bookmarks
	elif [[ $1 == "-d" ]]; then
		
		BOOKMARK="$(pwd)/"
		UPDATED=$( grep -v -o "^$BOOKMARK$" "$BASE_DIR/.cds-bookmarks" )

		echo "$UPDATED" > "$BASE_DIR/.cds-bookmarks"
		echo -e  "\033[1;31mbookmark deleted: \033[m $BOOKMARK"

	# delete all bookmarks
	elif [[ $1 == "-da" ]]; then 

		echo -n > "$BASE_DIR/.cds-bookmarks"
		echo -e  "\033[1;31mbookmarks cleared\033[m"

	elif [[ "$1" =~ ^-.*  ]]; then

		echo "bash: cds: $1: invalid option"
		echo "cds: usage: cd [-|-s|-d|-da] [dir]"

	elif [[ $( ls -l | grep -c ^d ) == 0 ]]; then
		
		echo " - No Directories Present - "

	else

	SEARCH=$1
	EXACTMATCH_COUNT=$( ls -d */ .*/ | grep ^$SEARCH$ -c 	 )
	PARTIALMATCH_COUNT=$( ls -d */ .*/ | grep -i ^$SEARCH.*$2/$ -c  )

	set_ifs '/
	'

	# If input is numeric
	if is_numeric $SEARCH ; then
	
		array=(`ls -d */ `)
		cd "${array[ $SEARCH - 1 ]}"
	
	# If input matches a directory name
	elif [ $EXACTMATCH_COUNT == "1" ]; then 
		
		cd $SEARCH		

	else
		
		# If partial match of one directory
		if [ $PARTIALMATCH_COUNT == "1" ]; then
			cd $( ls -d */ .*/ | grep -i ^$SEARCH.*$2/$ )
		
		# If partial match of one directory	
		elif [ "$PARTIALMATCH_COUNT" -gt "1" ]; then
			
			# include hidden folders if first character of search term is a '.'
			if [[ "$SEARCH" =~ ^\..* ]]; then
				array=( $( ls -d */ .*/ | grep -o -i ^$SEARCH.*$2/$ ) )
			else
				array=( $( ls -d */ | grep -o -i ^$SEARCH.*$2/$ ) )
			fi

			indexed_list $array

			callback="cds"
			select_directory $array $callback

		else 
			cd $SEARCH
		fi
	fi

	set_ifs
	
	fi
}

function indexed_list {

	array=$1
	mark_bookmarks=$2
	index=1
	p="$(pwd)"
	BOOKMARKS="$(cat "$BASE_DIR/.cds-bookmarks")"

	for i in "${array[@]}"; do
		BOOKMARK_MATCH=$( echo "$BOOKMARKS" | grep -i -o "^$p/$i/$")
		if [[ $BOOKMARK_MATCH ]];then 
			echo -e "\033[32m$index\033[39m:\033[1;32m $i \033[m"
		else
			echo -e "\033[32m$index\033[39m: $i"
		fi
		((index++))
	done

}

function select_directory {

	array=$1
	callback=$2

	printf "\e[1;30mSelect one Or press [enter] to exit > \e[m " 
	read -r DIR

	if is_numeric $DIR; then 
		cd "${array[$(( $DIR - 1 ))]}"
	elif [ $callback ] && [ "$DIR" != "" ]; then 
		$callback $DIR
	fi	

}

function select_directory_with_bookmarks {
	array=$1
	callback=$2
	select_directory 
}

function set_ifs {

	if [[ $1 ]]; then
		IFS=$1
	else
		IFS='
		'
	fi

}

function is_numeric {
	if [ "$1" -eq "$1" ] 2>/dev/null; then 
		return 0
	else
		return 1
	fi
}