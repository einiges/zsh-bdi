#compdef bdi

zstyle ':completion:*:*:bdi:*' sort false
zstyle ':completion:*:*:bdi:*:ancestors' list-colors "=*=${LS_COLORS[(ws.:.r)di=*]##di=}"

function _bdi {

	_arguments -C -S \
		'-n[considered pattern notations]:notations:->notations' \
		'-h[help]' \
		'::directory:->directories'

	case "$state" in
		notations)
			compset -P '*'
			local -a flags
			flags+=(
				'd:dot-notation'
				'e:empty'
				'n:number-notation'
				'w:word-notation'
			)
			_describe -t flags 'notation flag' flags -Q -S ''
			return
			;;
		directories )
			local -a ancestors
			ancestors=( ${(s:/:)PWD:h} )
			ancestors=( ${(Oa)ancestors} / )

			_describe -t 'ancestors' 'ancestor directories' ancestors
			return
			;;
	esac
}

_bdi "$@"

