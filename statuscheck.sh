#!/bin/bash

cd /home/kaj/Documents/Servers/MCBrosJan22
# pgrep Process to exact pattern/command line
pgrep -x -f 'tmux new-session -d -s mc_session ./run.sh'

# Exit status condition, 0 True 1 False?
res=$?
# If server is not running '1' then run
if (($res == '1'))
then
	tmux new-session -d -s mc_session './run.sh'
fi
