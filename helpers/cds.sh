#Work In Progress
function cds {
	NUM=$( echo $1 | grep ^[0-9]*$ )
	MATCH=$( ls | grep ^$1$ -c )
	ANY=$( ls | grep -i ^$1.*$2$ -c )
	if [[ "$NUM" != '' ]]
		echo "a>$NUM<a"
		array=( $( ls -d */ | grep -o "" ) )
		then cd "${array[$(( $1 - 1 ))]}" 	
	fi
	if [ $MATCH == "1" ]; 
		then cd $1		
	else
		if [ "$ANY" == "1" ] ;
			then
			cd $( ls | grep -i ^$1.*$2$ )
		else 
			array=( $( ls -d */ | grep -o -i ^$1.*$2$ ) )
			index=1
			for i in "${array[@]}" 
			do
				echo -e "\033[32m$index\033[39m: $i"
				((index++))
			done

			printf "Select one Or press [enter] to exit > " 
			read -r DIR

			if [ "$DIR" != "" ]
				then cd "${array[$(( $DIR - 1 ))]}"
			fi
		fi
	fi

	array=( $( ls -d */ | grep -o "" ) )
	ind=1
	# echo -e "\033[32mCurrent Directory Structure:\033[39m"
	for i in "${array[@]}" 
	do
		DIRNAME=$( echo $i | sed 's/\///')
		echo -en "\033[32m$ind\033[39m:$DIRNAME  "
		((ind++))
	done
	echo ""
}