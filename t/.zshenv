source ${PROJECT}/zsh-bdi.zsh

pwd() {
	print ${PWD##${CRAMTMP}/${TESTFILE}(/|)}
}

mkcd() {
	[[ ! -d "$1" ]] && mkdir -p "$1"
	cd "$1"
}

cdh() {
	cd "$CRAMTMP/$TESTFILE"
}

hmkcd() {
	cdh
	mkcd "$1"
}
