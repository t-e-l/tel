#!/usr/bin/env bash
running=$(pgrep -f status_manager.py)
if [ -z "$running" ] ; then
	# todo: fix not spawning on pane 1
	tmux new-window -n 'StatusManager' 'python ~/.tel/scripts/status_manager/status_manager.py'
	#tmux new-window 'python ~/.tel/scripts/status_manager/status_manager.py' # fix for duplicate naming error
	tmux join-pane -d -b -s 'StatusManager' -t 1.top #for each pane trigger joining of status pane
	tmux rename-window -t 1 $NAME
	tmux select-pane -t 1.top -T 'Status' -d	#disable input to status manager window
	#need a way to lock pane height
else
	kill "$(pgrep -f 'status_manager.py')"
	pkill -f 'termux-api' 
fi
