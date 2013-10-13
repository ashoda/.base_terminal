#Work In Progress
function cds {	
	if [[ $1 == "-s" ]]; then 
		if [[ $2 != "" ]]; then
			bookmark="$(pwd)/$2"
		else
			bookmark="$(pwd)/"
		fi
		updated=$( grep -v -o "^$bookmark$" "$BASE_DIR/.cds-bookmarks" )
		echo "$updated" > "$BASE_DIR/.cds-bookmarks"
		echo "$bookmark" >> "$BASE_DIR/.cds-bookmarks"
	elif [[ $1 == "-" ]]; then
		array=( $( cat "$BASE_DIR/.cds-bookmarks" ) )	
		index=1
		echo -e "\033[0;32mBookmarked Directories: \033[m"

		for i in "${array[@]}" 
		do
				echo -e "\033[32m$index\033[39m: $i"
				((index++))
		done

		printf "\e[1;30mSelect one Or press [enter] to exit > \e[m " 
		read -r DIR

		if [ "$DIR" != "" ]
			then cd "${array[$(( $DIR - 1 ))]}"
		fi	

	elif [[ $1 == "-d" ]]; then
		unbookmark="$(pwd)/"
		updated=$( grep -v -o "^$unbookmark$" "$BASE_DIR/.cds-bookmarks" )
		echo "$updated" > "$BASE_DIR/.cds-bookmarks"
	elif [[ $1 == "-da" ]]; then
		echo "" > "$BASE_DIR/.cds-bookmarks"
	else

	SEARCH=$1
	EXACTMATCH_COUNT=$( ls -d */ .*/ | grep ^$1$ -c 	 )
	PARTIALMATCH_COUNT=$( ls -d */ .*/ | grep -i ^$1.*$2/$ -c  )

	IFS='/
	'
	# If input is numeric
	if [ "$SEARCH" -eq "$SEARCH" ] 2>/dev/null; then
		array=(`ls -d */ `)
		cd "${array[ $SEARCH - 1 ]}"
	# If input matches a directory name
	elif [ $EXACTMATCH_COUNT == "1" ]; then 
		cd $1		
	else
		# If partial match of one directory
		if [ $PARTIALMATCH_COUNT == "1" ] ;
			then
			cd $( ls -d */ .*/ | grep -i ^$1.*$2/$ )
		# If partial match of one directory	
		elif [ "$PARTIALMATCH_COUNT" -gt "1" ] ; then
			if [[ "$1" =~ ^\..* ]]; then
				array=( $( ls -d */ .*/ | grep -o -i ^$1.*$2/$ ) )
			else
				array=( $( ls -d */ | grep -o -i ^$1.*$2/$ ) )
			fi
			index=1
			for i in "${array[@]}" 
			do
					echo -e "\033[32m$index\033[39m: $i"
					((index++))
			done

			printf "\e[1;30mSelect one Or press [enter] to exit > \e[m " 
			read -r DIR

			if [ "$DIR" != "" ]
				then cd "${array[$(( $DIR - 1 ))]}"
			fi	
		else 
			cd $1	
		fi
	fi
	IFS='
	'
	fi
}