alias hk=heroku

function hcs {
	SKIPED_VARIABLE_ATTRIBUTE=""
	IFS='|'

	for var in "$@"
	do
		if [[ $SKIPED_VARIABLE_ATTRIBUTE ]]; then
			echo -e "\033[32mAPP CONFIG\033[39m: $var"
			echo -e "=================================================="

			ALL_CONFIGS=$(heroku config -a $var )

			if [[ $1 ]]; then 
				for config in $1  
				do
					echo "$ALL_CONFIGS" | grep -E $config
				done
			else
				echo "$ALL_CONFIGS"
			fi

		fi
		SKIPED_VARIABLE_ATTRIBUTE=true
	done
}