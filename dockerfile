# Use a lightweight base image
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    x11vnc \
    xvfb \
    openbox \
    && apt-get clean

# Install a lightweight desktop environment
RUN apt-get update && apt-get install -y \
    xfce4 \
    xfce4-terminal \
    && apt-get clean

# Set up a VNC password (optional)
RUN mkdir ~/.vnc && \
    x11vnc -storepasswd 1234 ~/.vnc/passwd

# Start the VNC server with a display
CMD ["sh", "-c", "Xvfb :0 -screen 1024x768x16 & openbox & x11vnc -display :0 -forever -usepw"]

