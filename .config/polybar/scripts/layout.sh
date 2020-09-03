#!/bin/sh

keyprint() {
        key=$(setxkbmap -query | grep layout | tail -c 3 | head -c 2)
        dv="ak"
        us="us"
	
	echo $key
}

path_pid="/tmp/keylayout.pid"


case "$1" in
        --update)
                pid=$(cat $path_pid)

                if [ "$pid" != "" ]; then
                        kill -10 "$pid"
                fi
                ;;
        *)
                echo $$ > $path_pid

                trap exit INT
                trap "echo" USR1

                while true; do
                        keyprint

                        sleep infinity &
                        wait
                done
                ;;
esac
