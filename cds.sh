#Work In Progress
function cds {
	SEARCH=$1
	EXACTMATCH_COUNT=$( ls -d */ .*/ | grep ^$1$ -c )
	PARTIALMATCH_COUNT=$( ls -d */ .*/ | grep -i ^$1.*$2/$ -c )
	IFS='/
	'
	
	# If input is numeric
	if [ "$SEARCH" -eq "$SEARCH" ] 2>/dev/null; then
		array=(`ls -d */ .*/ `)
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
			array=( $( ls -d */ .*/ | grep -o -i ^$1.*$2/$ ) )
			index=1
			for i in "${array[@]}" 
			do
				if [[ "$1" =~ ^\..* ]] || [[ "$i" =~ ^[^\.].* ]] ; then
					echo -e "\033[32m$index\033[39m: $i"
					((index++))
				fi
			done

			printf "Select one Or press [enter] to exit > " 
			read -r DIR

			if [ "$DIR" != "" ]
				then cd "${array[$(( $DIR + 1 ))]}"
			fi	
		else 
			cd $1	
		fi
	fi
	IFS='
	'
}