#compdef bd

zstyle ':completion:*:*:bd:*' sort false

function _bd {
	_arguments -S \
		'-f[force number]:number:->numbers' \
		'*:directory:->directories'

	local -a parents
	parents=( ${(s:/:)PWD:h} )
	parents=( ${(Oa)parents} / )

	case "$state" in
		numbers)
			local -a numparents
			for i in {1..$(($#parents - 1))}; numparents[$i]="$i""[${parents[$i]}]"
			numparents+=( '0[/]' )
			_values 'numbered parent directories' $numparents
			;;
		directories )
			_describe -t directories 'parent directories' parents
			;;
	esac

}

_bd "$@"
