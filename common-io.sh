#!/bin/bash
# Common IO operations

# From http://stackoverflow.com/a/12197227
realpath() {
	pushd . > /dev/null
	SCRIPT_PATH="${BASH_SOURCE[0]}";
	while([ -h "${SCRIPT_PATH}" ]) do
        	cd "`dirname "${SCRIPT_PATH}"`"
	        SCRIPT_PATH="$(readlink "`basename "${SCRIPT_PATH"`")";
	done
	cd "`dirname "${SCRIPT_PATH}"`" > /dev/null
	SCRIPT_PATH="`pwd`";
	popd > /dev/null
	echo ${SCRIPT_PATH}
}
