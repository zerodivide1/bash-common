#!/bin/bash
# Wait for process to complete
# Source: http://joncairns.com/2013/03/wait-for-a-unix-process-to-finish/

pid=$1
me="$(basename $0)($$):"
if [ -z "$pid" ]
then
    echo "$me a PID is required as an argument" >&2
    exit 2
fi

name=$(ps -p $pid -o comm=)
if [ $? -eq 0 ]
then
    echo "$me waiting for PID $pid to finish ($name)"
    while ps -p $pid > /dev/null; do sleep 1; done;
else
    echo "$me failed to find process with PID $pid" >&2
    exit 1
fi
