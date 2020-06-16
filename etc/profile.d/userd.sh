# Find services directory
if [ ! -d "$RUNSVDIR_USER" ]; then
	export RUNSVDIR_USER="$HOME/.cache/sv"
	mkdir -p "$RUNSVDIR_USER"
fi

# If there is already an instance of runsvdir-user running,
# do not execute
if [ -d "$RUNSVDIR_USER" ] && [ ! -f "$RUNSVDIR_USER/pid" ]; then
	rm -r -f "$RUNSVDIR_USER"/**/supervise
	cp -r -f /etc/rsvd-user/* "$RUNSVDIR_USER"
	setsid runsvdir "$RUNSVDIR_USER" > "$RUNSVDIR_USER"/log 2> "$RUNSVDIR_USER"/err &
	echo $! > "$RUNSVDIR_USER"/pid
fi
