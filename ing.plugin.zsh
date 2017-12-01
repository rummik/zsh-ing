#!/bin/zsh

zmodload zsh/pcre

ing() {
	local host=$1 nl
	ping $1 | while read line; do
		if [[ $line -pcre-match 'time=(\d+\.?\d* ms)' ]]; then
			print -n "$nl$host: ${match[1]}"
			nl="\n"
		fi
	done
}
