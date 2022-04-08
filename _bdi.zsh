#compdef bdi

local curcontext="$curcontext" ret=1

_arguments -S \
	'-n[considered pattern notations]: :->notations' \
	'(- 1 *)-h[display usage information]' \
	'(-):: :->pattern' \
	&& ret=0

case "$state" in
	notations)
		compset -P '*'
		local -a flags
		flags=(
			'd:dot-notation'
			'e:empty'
			'n:number-notation'
			'w:word-notation'
		)
		_describe -t notations 'notation flag' flags -Q -S '' \
			&& ret=0
		;;
	pattern)
		local -a ancestors
		ancestors=( ${(Oas:/:)PWD:h} / )

		_describe -V -t directories 'directory' ancestors \
			&& ret=0
		;;
esac

return ret

