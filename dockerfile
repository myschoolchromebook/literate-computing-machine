# Use a lightweight base image
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    x11vnc \
    xvfb \
    openbox \
    && apt-get clean

# Set up a VNC password (optional)
RUN mkdir ~/.vnc && \
    x11vnc -storepasswd 1234 ~/.vnc/passwd

# Start the VNC server
CMD ["x11vnc", "-display", ":0", "-forever", "-usepw"]
