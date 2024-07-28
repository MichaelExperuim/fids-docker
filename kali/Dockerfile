FROM kalilinux/kali-rolling:latest

#RUN apt update -y && apt install -y openssh-client nmap net-tools netcat-traditional gobuster dirb burpsuite sqlmap iputils-ping iproute2 default-mysql-client
# Install required packages
RUN apt update -y && \
    apt install -y openssh-client nmap net-tools netcat-traditional gobuster dirb burpsuite sqlmap iputils-ping iproute2 default-mysql-client openjdk-11-jdk wget x11vnc xvfb xfce4 xfce4-terminal novnc websockify supervisor tigervnc-standalone-server fluxbox dbus-x11 python3 python3-pip && \
    rm -rf /var/lib/apt/lists/*

# Set VNC password
RUN mkdir -p /root/.vnc && \
    echo "password" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Copy the startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

#COPY serve_vnc_html.py /serve_vnc_html.py

# Copy the startup script
COPY burpsuite.desktop /root/Desktop/burpsuite.desktop
RUN chmod +x /root/Desktop/burpsuite.desktop

# Copy Burp Suite to the container
#COPY burpsuite /root/Desktop
#RUN chmod +x /root/Desktop/start_burpsuite.sh

# Expose necessary ports
EXPOSE 5901 8081

# Run the startup script
ENTRYPOINT ["/startup.sh"]