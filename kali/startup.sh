#!/bin/bash

service dbus start

vncserver :1 -geometry 1280x720 -depth 24 -rfbauth /root/.vnc/passwd

export DISPLAY=:1

# Start Xvfb
Xvfb :1 -screen 0 1280x720x24 &

# Start x11vnc
x11vnc -display :1 -rfbport 5901 -rfbauth /root/.vnc/passwd -forever -shared &

# Start websockify
websockify --web=/usr/share/novnc --wrap-mode=ignore 8081 localhost:5901 &

# Start fluxbox
fluxbox &

# Tail to keep the container running
tail -f /dev/null



