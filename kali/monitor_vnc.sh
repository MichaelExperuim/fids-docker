#!/bin/bash

# Wait for the VNC session to start
while true; do
    # Check if the VNC session is active
    if pgrep -x "x11vnc" > /dev/null; then
        echo "VNC session is active. Starting Burp Suite..."

        # Check if Burp Suite is already running
        if ! pgrep -x "burpsuite" > /dev/null; then
            # Start Burp Suite
            /usr/bin/burpsuite &
            echo "Burp Suite started."
        else
            echo "Burp Suite is already running."
        fi

        # Exit the loop after starting Burp Suite
        break
    fi

    # Wait before checking again
    sleep 3
done