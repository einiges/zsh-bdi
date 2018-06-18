#compdef bdi

zstyle ':completion:*:*:bdi:*' sort false

function _bdi {
	_arguments -S \
		'-d[dry run]' \
		'-f[force number]:number:->numbers' \
		'-h[help]' \
		'*:directory:->directories'

	local -a parents
	parents=( ${(s:/:)PWD:h} )
	parents=( ${(Oa)parents} / )

	case "$state" in
		numbers)
			local -a numparents
			for i in {1..$(($#parents - 1))}; numparents+=("$i""[${parents[$i]}]")
			numparents+=( '0[/]' )
			_values 'numbered parent directories' $numparents
			;;
		directories )
			_describe -t directories 'parent directories' parents
			;;
	esac

}

_bdi "$@"
