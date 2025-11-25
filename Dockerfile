# This file is used to build a docker image that will be used to test my dotfiles setup
FROM alpine:latest

# Install necessary packages
RUN apk add --no-cache \
    git \
    bash \
    curl \
    openssh

# (Optional) TODO: Add ansible setup here when needed
# RUN apk add --no-cache ansible

# Clone your dotfiles repository
RUN git clone https://github.com/joelkema/dotfiles.git /root/dotfiles

# Set working directory
WORKDIR /root/dotfiles

# Make sure the install script is executable
RUN chmod +x install.sh

# Run the install script (you can switch to --dry-run for testing)
RUN ./install.sh

# Set default command
CMD ["/bin/bash"]

