#!/usr/bin/env zsh

function bdi {
	zparseopts -D -A opts f

	(( $# == 0 )) &&
		{ cd $PWD:h; return }

	local parents=( / ${(s:/:)PWD:h} )
	local dest=${(j:*:)@}

	if [[ ! -v opts[-f] ]]
	then
		local d
		(( d=${parents[(I)$dest]} )) || (( d=${parents[(I)$dest*]} ))

		(( d > 0 )) &&
			{ cd "/${(j:/:)parents[2, $d]}"; return }
	fi

	[[ $dest == <1-> ]] &&
		{ cd "/${(j:/:)parents[2, (( $#parents - dest + 1 ))]}"; return }

	[[ $dest == <0-0> ]] &&
		{ cd /; return }

	return 1
}

# vim: noet
