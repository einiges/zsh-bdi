#!/usr/bin/env zsh

function -bdi::out {
	if [[ -v opts[-d] ]]; then
		print "$1"
	else
		cd "$1"
	fi
}

function bdi {
	zparseopts -D -A opts f d h

	[[ -v opts[-h] ]] && {
		<<- EOU
			usage: $0 [-fdh] [n|parent|{pattern ...}|{.[...]}]

			   -f     parent will be interpreted as a number
			   -d     print new directory to stdout instead of changing
			   -h     print this help
		EOU
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

		[[ "$dest" =~ '^\.+$' ]] &&
			{ -bdi::out "/${(j:/:)parents[2,-(${#dest}+1)]}"; return }
	fi

	[[ $dest == <1-> ]] &&
		{ -bdi::out "/${(j:/:)parents[2, $#parents - dest + 1]}"; return }

	[[ $dest == <0-0> ]] &&
		{ -bdi::out /; return }

	return 1
}

# vim: noet
