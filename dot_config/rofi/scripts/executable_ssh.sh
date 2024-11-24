LOGFILE="/tmp/rofi_ssh_debug.log"
echo "Script executed at $(date)" >>"$LOGFILE"
echo "Arguments: $@" >>"$LOGFILE"

if /usr/bin/tmux has-session 2>/dev/null; then
  echo "Tmux session exists." >>"$LOGFILE"
  /usr/bin/tmux new-window -n "SSH-$1" "/usr/bin/ssh $1"
else
  echo "No tmux session found." >>"$LOGFILE"
  /usr/bin/tmux new-session -s main "/usr/bin/ssh $1"
fi
