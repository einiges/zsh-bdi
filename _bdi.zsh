#compdef bdi

zstyle ':completion:*:*:bdi:*' sort false

function _bdi {

	_arguments -S \
		'-f[force number]:number:->numbers' \
		'-h[help]' \
		':directory:->directories'

	local -a ancestors
	ancestors=( ${(s:/:)PWD:h} )
	ancestors=( ${(Oa)ancestors} / )

	case "$state" in
		numbers)
			local -a numancestors
			for i in {1..$(($#ancestors - 1))}; numancestors+=("$i""[${ancestors[$i]}]")
			numancestors+=( '0[/]' )
			_values 'numbered ancestor directories' $numancestors
			;;
		directories )
			_describe -t path-directories 'ancestor directories' ancestors
			;;
	esac

}

_bdi "$@"

