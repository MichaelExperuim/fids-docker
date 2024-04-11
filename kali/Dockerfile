# Use Kali Linux as the base image
FROM kalilinux/kali-rolling

# Install necessary tools for security testing
RUN apt-get update && apt-get install -y \
    nmap \
    burpsuite \
    hydra \
    && apt-get clean

# Remove any need for a password (for the CTF context)
RUN echo "root:root" | chpasswd

# When the container starts, automatically drop into a shell
CMD ["/bin/bash"]
CMD ["tail", "-f", "/dev/null"]