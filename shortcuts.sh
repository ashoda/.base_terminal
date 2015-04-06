[ ! -n "$BASE_TERMINAL_SHORTCUTS" ] && BASE_TERMINAL_SHORTCUTS=()

function bt:add_shortcut {
	BASE_TERMINAL_SHORTCUTS+=("${IRed}[$3]${RCol} ${Gre}$1${RCol} ${Yel} ${RCol} $2")
	eval "??:${3}() { sc $3; }"
	alias "$1?"="echo -e ${2}"
	alias $1="$2"
}
function bt:add_function {
  BASE_TERMINAL_SHORTCUTS+=("${IRed}[$3]${RCol} ${Gre}$1${RCol} ${Yel} ${RCol} $2")
  eval "sc:${3}() { sc $3; }"
  alias "$1?"="echo -e ${2}"
}

function ?? {
	for var in "${BASE_TERMINAL_SHORTCUTS[@]}"
	do
		echo -e "${var}";
	done | grep "$1"
}
