#!/bin/zsh

ing() {
	local host=$1 nl
	ping $1 | while read line; do
		if [[ $line != ${line//*time=} ]]; then
			print -n "$nl$host: ${line//*time=}"
			nl="\n"
		fi
	done
}
