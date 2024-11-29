# This file is used to build a docker image that will be used to test my dotfiles setup

FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache \
    git \
    bash \
    curl \
    openssh

# TODO add ansible

# Clone your dotfiles repository
RUN git clone https://github.com/yourusername/dotfiles.git /root/dotfiles

# Set working directory
WORKDIR /root/dotfiles

# Run the install script
RUN chmod +x install.sh && ./install.sh

# Set the default command
CMD ["/bin/bash"]

