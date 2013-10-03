#Work In Progress
function cds {
	SEARCH=$1
	EXACTMATCH=$( ls -d */ | grep ^$1$ -c )
	ANY=$( ls -d */ | grep -i ^$1.*$2$ -c )
	IFS='/
	'
	if [ $EXACTMATCH == "1" ]; 
		then cd $1		
	elif [ "$SEARCH" -eq "$SEARCH" ] 2>/dev/null; then
		array=(`ls -dt */ `)
		cd "${array[ $SEARCH - 1 ]}"
	else
		if [ "$ANY" == "1" ] ;
			then
			cd $( ls -dt */ | grep -i ^$1.*$2$ )
		else 
		 	
			array=( $( ls -dt */ | grep -o -i ^$1.*$2$ ) )
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
	IFS='
	'
}