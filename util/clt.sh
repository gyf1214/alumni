#!/bin/bash

case "$1" in 
	start)
	unicorn -c unicorn.rb -D
	;;
	stop)
	kill -QUIT `cat tmp/application.pid`
	;;
	restart)
	kill -USR2 `cat tmp/application.pid`
	;;
	*)
	echo "Usage: clt.sh {start | stop | restart}" >&2
	exit 3
	;;
esac

