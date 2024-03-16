
process=$1

command_given(){
	if [ $# != 0 ]; then
		echo "Process detected. Checking in progress"
	else
		echo "Process not found. Exiting the program...."
	fi
}

command_given

running_process(){
	if pgrep -x "process" >/dev/null; then
		echo "$process is running."
		return 0
	else
		echo "$process is not running."
		return 1
	fi
}

restart_process(){
	running_process

	if [ $? -eq 1 ]; then
		if systemctl is-enabled "$process" >/dev/null 2>&1; then
			echo "Restarting $process using systemd..."
			sudo systemctl restart "$process"
		else
			echo "Restarting $process using kill -HUP..."
			process_pid=$(pgrep -x "$process")
			if [ -n "$process_pid" ]; then
				kill -HUP "$process_pid"
			else
				echo "Failed to find the process ID for $process"
			fi
		fi
	else
		echo "$process is already running"
	fi

}

max_attempts=3
attempt=1

while [ "$attempt" -le "$max_attempts" ]; do
	if running_process "$process"; then
		echo "Process $process is running"
	else
		restart_process "$process"
	fi
	attempt=$((attempt + 1))
	sleep 5
done

echo "Maximum restart attempts value reached. Check the process manually"
