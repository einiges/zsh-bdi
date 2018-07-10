#!/usr/bin/env zsh

function -bdi::out {
	if [[ -v opts[-d] ]]; then
		printf "$1\n"
	else
		cd "$1"
	fi
}

function bdi {
	zparseopts -D -A opts f d h

	[[ -v opts[-h] ]] && {
		print "usage: $0 [-fdh] [n|parent|{pattern  ...}]\n\n" \
		      "   -f     parent will be interpreted as a number\n" \
		      "   -d     print new directory to stdout instead of changing\n" \
		      "   -h     print this help"
		return 0
	}

	(( $# == 0 )) &&
		{ -bdi::out $PWD:h; return }

	local parents=( / ${(s:/:)PWD:h} )
	local dest=${(j:*:)@}

	if [[ ! -v opts[-f] ]]
	then
		local d
		(( d=${parents[(I)$dest]} )) || (( d=${parents[(I)$dest*]} ))

		(( d > 0 )) &&
			{ -bdi::out "/${(j:/:)parents[2, $d]}"; return }
	fi

	[[ $dest == <1-> ]] &&
		{ -bdi::out "/${(j:/:)parents[2, $#parents - dest + 1]}"; return }

	[[ $dest == <0-0> ]] &&
		{ -bdi::out /; return }

	return 1
}

# vim: noet
