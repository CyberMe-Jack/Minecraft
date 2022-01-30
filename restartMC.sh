#!/bin/bash

# Date Developed: 20211201
# Author: Cyber.Me
# Purpose: Bash script for restarting minecraft server, backing up server and saving to cloud using RClone




cd /home/kaj/Documents/Servers/MCBrosJan22
# Close mc_session
tmux send-keys "stop" Enter >> end.log

# Set time variable for file extension
time=$(date +"%m_%d_%Y_%H%M")

sleep 10s
# compress everything inside of current directory
tar -zcf ./backups/MC.backup-${time}.tgz ./*

# Copy .tgz to NextCloud, using Rclone
rclone copy /home/kaj/Documents/Servers/MCBrosJan22/backups/*.tgz NextCloud: --no-check-certificate
# Move files from backup dir to uploaded dir, mainly because Rclone accepts only one argument at a time. 
mv /home/kaj/Documents/Servers/MCBrosJan22/backups/*.tgz /home/kaj/Documents/Servers/MCBrosJan22/backups/uploaded

# Create new tmux session named mc_session with the run.sh script
tmux new-session -d -s mc_session './run.sh'
