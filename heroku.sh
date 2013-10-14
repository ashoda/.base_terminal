alias hk=heroku

#Usage heroku:apps app1_partial_name app2_partial_name app3
function heroku:apps {
	if [[ $1 == "" ]]; then	
		echo -e "\033[32mHeroku Apps\033[39m:"
		echo "=================================================="
		heroku apps
	else
		for var in "$@"
		do
			app=$(echo "$app" | xargs)
			echo -e "\033[32mApps Matching $var\033[39m: $app"
			echo "=================================================="
			heroku apps | grep -E ^.*$var.* 
		done
		echo -e \r
	fi
}

# Usage heroku:configs searchTerm1,AnotherTerm,partialTerm3 app1_partial_name app2 app3_partial_name
function heroku:configs  {
	SKIPED_VARIABLE_ATTRIBUTE=""
	APPS=$( heroku apps | grep -E -o "^.* " )
	APP_COUNT=$( echo "$APPS" | grep -E -c ".*$2.*" )

	if [[ 15 -ge $APP_COUNT ]]; then 
		# Iterate Over Apps to Search
		for var in "$@"; do
			# Skip First Argument Since It Declare Term(s) To Be Searched In App Configs

			if [[ $SKIPED_VARIABLE_ATTRIBUTE ]]; then
				# Array Of Apps Tha Match App Search String  
				var=$(echo "$var" | xargs)
				array=( $( echo "$APPS" | grep "$var" ) ) 

				echo -e "\033[4;32mApps Matching '$var' With Configs Matching '$1' \033[m"

				for app in "${array[@]}"; do 
					app=$(echo "$app" | xargs)
					ALL_APP_CONFIGS=$( heroku config -a "$app" )
					echo -e "\033[4;36m$app\033[m"

					IFS=','
					if [[ $1 ]]; then 
						for config in $1; do
							search_match_count=$( echo "$ALL_APP_CONFIGS" | grep -c "$config" ) 
							if [ "$search_match_count" != "0" ]; then
								echo -e "\033[0;37m$( echo "$ALL_APP_CONFIGS" | grep -i -E $config ) \033[m"
							else
								echo -e "\033[31m   * no config vars matching '$config' *   \033[39m"
							fi
						done
					else
						echo "$ALL_APP_CONFIGS"
					fi
				done 
				echo -e "\r"
			fi
			SKIPED_VARIABLE_ATTRIBUTE=true
			IFS='
			'
		done
	else
		echo -e "\033[1;30m ##       Be More Specific There Are More Than 15 APPS      ## \033[0m"
		echo -e "\033[1;30m ##   Usage: heroku:configs 'CONFIG_VAR' [app]  ## \033[0m"
	fi
}


